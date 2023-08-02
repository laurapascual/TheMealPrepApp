//
//  Meal.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import Foundation

struct Meal: Codable, Identifiable {
    let id: String
    let image: URL
    let name: String
    let instructions: String
    let area: String
    let tags: String?
    let videoUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case image = "strMealThumb"
        case name = "strMeal"
        case instructions = "strInstructions"
        case area = "strArea"
        case tags = "strTags"
        case videoUrl = "strYoutube"
    }
}
