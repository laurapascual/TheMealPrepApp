//
//  RemoteDataSourceImpl.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let server: String = "https://www.themealdb.com/api/json/v1/1/search.php?f=a"
    
    func getMeals() async throws -> [Meal]? {
        let url = URL(string: server)!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        print(data)
        
        let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
        print(mealsResponse)
        return mealsResponse.meals
    }
}
