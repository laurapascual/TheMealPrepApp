//
//  RemoteDataSourceImpl.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session: NetworkFetchingProtocol
    private let server: String = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    private let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u", "v","w","x","y","z"]
    
    init(session: NetworkFetchingProtocol = URLSession.shared) {
            self.session = session
        }
    
    func getMeals() async throws -> [Meal] {
        var arrayMeals: [Meal] = []
        for letter in letters {
            guard let url = getMealsSession(letter: letter) else {
                return []
            }
            
            var (data, _): (Data, URLResponse) = (Data(), URLResponse())
            
            do {
                (data, _) = try await session.data(url: url)
                let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
                arrayMeals.append(contentsOf: mealsResponse.meals)
            }
            catch {
                continue
            }
            
        }
        
        return arrayMeals
    }
}

extension RemoteDataSourceImpl {
    
    func getMealsSession(letter: String) -> URLRequest? {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=" + letter) else {
                print("URL Error")
                return nil
            }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            return urlRequest
        }
}
