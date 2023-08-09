//
//  RepositoryImpl.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
            self.remoteDataSource = remoteDataSource
        }
    
    func getMeals() async throws -> [Meal] {
        return try await remoteDataSource.getMeals()
    }
    
}
