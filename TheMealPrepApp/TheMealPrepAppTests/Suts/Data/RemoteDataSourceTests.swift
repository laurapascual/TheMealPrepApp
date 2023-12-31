//
//  RemoteDataSourceTests.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 3/8/23.
//

import XCTest
@testable import TheMealPrepApp

final class RemoteDataSourceTests: XCTestCase {
    
    var sut: RemoteDataSourceProtocol?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RemoteDataSourceImpl()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRemoteDataSource_whenGetMealsWithSuccessResult_expectMeals() async throws {
            
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [URLProtocolMock.self]
            
            let mockURLSession = URLSession.init(configuration: configuration)
            sut = RemoteDataSourceImpl(session: mockURLSession)
            
            URLProtocolMock.requestHandler = { request in
                let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
                let meals = MealsResponse(meals: [Meal(id: "1", image: URL(string: "url")!, name: "name", instructions: "", area: "", tags: "", videoUrl: "")])
                let data = try JSONEncoder().encode(meals)
                return (response, data)
            }
            
            guard let meals = try? await sut?.getMeals() else {
                XCTFail("Meals must contain a meal")
                return
            }
            
            XCTAssertNotNil(meals.first)
            XCTAssertEqual(meals.first?.name, "name")
        }
}
