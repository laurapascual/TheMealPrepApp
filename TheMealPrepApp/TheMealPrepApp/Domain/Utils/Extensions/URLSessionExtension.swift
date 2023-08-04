//
//  URLSessionExtension.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 4/8/23.
//

import Foundation

extension URLSession: NetworkFetchingProtocol {
    
    func data(url: URLRequest) async throws  -> (Data, URLResponse) {
        return try await data(for: url)
    }
}
