//
//  RepositoryTests.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 7/8/23.
//

import XCTest
@testable import TheMealPrepApp

final class RepositoryTests: XCTestCase {
    
    var sut: RepositoryProtocol?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let remoteDataSource = RemoteDataSourceMock()
        sut = RepositoryImpl(remoteDataSource: remoteDataSource)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRepository_whenGetMealsWithSuccessResult_expectMeals() async throws {
        let getMeals = try await sut?.getMeals()
        XCTAssertNotNil(getMeals)
    }

}
