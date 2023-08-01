//
//  Meal.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import Foundation

struct Meal : Decodable {
    let idMeal: String
    let strMealThumb: String
    let strMeal: String
    let strArea: String
    let strTags: String?
    let strYoutube: String
}
