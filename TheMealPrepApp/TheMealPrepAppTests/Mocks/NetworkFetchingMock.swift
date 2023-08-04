//
//  NetworkFetchingMock.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 3/8/23.
//

import Foundation
import Combine
@testable import TheMealPrepApp

class NetworkFetchingMock: NetworkFetchingProtocol {
    
    let result: Result<Data, Error>

    init(returning result: Result<Data, Error>) {
        self.result = result
    }
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return ("".data(using: .utf8)!,URLResponse())    }
}
