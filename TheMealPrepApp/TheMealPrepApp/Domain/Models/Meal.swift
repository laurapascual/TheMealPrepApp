//
//  Meal.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import Foundation

struct Meal: Codable {
    let id: String
    let image: String
    let name: String
    let area: String
    let tags: String?
    let videoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case image = "strMealThumb"
        case name = "strMeal"
        case area = "strArea"
        case tags = "strTags"
        case videoUrl = "strYoutube"
    }
}
