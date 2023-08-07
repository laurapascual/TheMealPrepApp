//
//  ListViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 2/8/23.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    @Published var filterOption: AreaEnum = .none
    @Published var searchText = ""
    @Published var meals: [Meal] = []
    
    var filteredMeals: [Meal] {
        let meals = self.meals
        guard !filterOption.rawValue.isEmpty else {return meals}
        return meals.filter{$0.area.contains(filterOption.rawValue)}
    }
    
    var searchedMeals: [Meal] {
        let meals = filteredMeals
        guard !searchText.isEmpty else {return meals}
        return meals.filter{$0.name.lowercased().starts(with:searchText.lowercased())}
    }
        
        init(repository: RepositoryProtocol) {
            self.repository = repository
            self.getAllMeals()
        }
    
    func getAllMeals() {
        DispatchQueue.main.async {
            Task {
                guard let mealsFromApi = try? await self.repository.getMeals() else {
                    self.meals = []
                    print("Unable to get meals from api")
                    return
                }
                self.meals = mealsFromApi
            }
        }
    }
    
}
