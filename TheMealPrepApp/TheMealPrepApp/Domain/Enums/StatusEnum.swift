//
//  StatusEnum.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 9/8/23.
//

import Foundation

enum Status: Equatable {
    case `default`
    case loaded
    case error(error: String)
}
