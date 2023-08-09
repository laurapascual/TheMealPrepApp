//
//  RepositoryProtocol.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation

protocol RepositoryProtocol {
    func getMeals() async throws -> [Meal]
}
