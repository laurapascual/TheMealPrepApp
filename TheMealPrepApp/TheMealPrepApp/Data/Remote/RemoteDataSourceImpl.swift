//
//  RemoteDataSourceImpl.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation
import Combine

enum NetworkError: Error {
    case malFormedURL
    case noData
    case errorCode(Int?)
    case decoding
    case other
}

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session: URLSession = URLSession.shared
    private let server: String = "https://www.themealdb.com/api/json/v1/1/"
    
    func getMeals() async throws -> [Meal]? {
        
        guard let url = getSessionMeals() else {
            throw NetworkError.malFormedURL
        }
        
        let (data, _) = try await URLSession.shared.data(for: url)
        
        let meals = try JSONDecoder().decode([Meal].self, from: data)
        meals.forEach { meal in
            print(meal.name)
        }
        return meals
    }
    
    
    func getSessionMeals() -> URLRequest? {
        
        guard let url = URL(string: "\(server)/meals/all") else {
            print("Error: invalid URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    
    
}

