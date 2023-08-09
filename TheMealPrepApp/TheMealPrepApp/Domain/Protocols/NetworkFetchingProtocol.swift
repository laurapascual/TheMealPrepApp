//
//  NetworkFetchingProtocol.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 3/8/23.
//

import Foundation

protocol NetworkFetchingProtocol {
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
