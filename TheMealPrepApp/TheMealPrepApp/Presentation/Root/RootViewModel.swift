//
//  RootViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation
import Combine

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}


final class RootViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    @Published var status = Status.none
    private var subscribers = Set<AnyCancellable>()
    
    init(repository: RepositoryProtocol) {
            self.repository = repository
        }
    
    func onClick() {
            Task {
                guard let mealsFromApi = try? await repository.getMeals() else {
                    print("Unable to get meals from api")
                    return
                }
                print(mealsFromApi)
            }
    }
}
