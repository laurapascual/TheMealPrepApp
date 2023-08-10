//
//  RootViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    @Published var status = Status.default
    
    init(repository: RepositoryProtocol, status: Status = Status.default) {
        self.repository = repository
        self.status = status
        }
    
    func onClick() {
        status = .loaded
    }
    
    func goToHome() {
        status = .default
    }
}
