//
//  MealsResponse.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

struct MealsResponse : Decodable {
    let meals: [Meal]
}
