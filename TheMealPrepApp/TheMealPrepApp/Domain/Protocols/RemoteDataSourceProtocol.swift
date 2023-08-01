//
//  RemoteDataSourceProtocol.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation
import Combine

protocol RemoteDataSourceProtocol {
    func getMeals() async throws -> [Meal]?
}
