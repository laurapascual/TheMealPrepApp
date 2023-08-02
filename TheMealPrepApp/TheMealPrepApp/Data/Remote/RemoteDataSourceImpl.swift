//
//  RemoteDataSourceImpl.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let server: String = "https://www.themealdb.com/api/json/v1/1/search.php?f=c"
    
    func getMeals() async throws -> [Meal]? {
        let url = URL(string: server)!
        print(url)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
        return mealsResponse.meals
    }
}
