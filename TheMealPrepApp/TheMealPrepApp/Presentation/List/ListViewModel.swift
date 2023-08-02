//
//  ListViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 2/8/23.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    private let repository: RepositoryProtocol
        @Published var meals: [Meal] = []
        
        init(repository: RepositoryProtocol) {
            self.repository = repository
            DispatchQueue.main.async {
                Task {
                    guard let mealsFromApi = try? await repository.getMeals() else {
                        self.meals = []
                        print("Unable to get meals from api")
                        return
                    }
                    self.meals = mealsFromApi
                }
            }
        }
    
}
