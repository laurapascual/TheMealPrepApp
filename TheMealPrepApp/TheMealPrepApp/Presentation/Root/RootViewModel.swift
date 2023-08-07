//
//  RootViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation
import Combine

enum Status: Equatable {
    case `default`
    case loading
    case loaded
    case error(error: String)
}


final class RootViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    @Published var status = Status.default
    
    init(repository: RepositoryProtocol, status: Status = Status.default) {
        self.repository = repository
        self.status = status
        }
    
    func onClick() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.status = .loaded
                                        }
        status = .loading
        
    }
    
    func goToHome() {
        status = .default
    }
}
