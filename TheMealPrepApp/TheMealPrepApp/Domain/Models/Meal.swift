//
//  Meal.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import Foundation

struct Meal : Decodable {
    let image: URL // strMealThumb
    let name: String // strMeal
    let area: String // strArea
    let tags: String // strTags
}
