//
//  ListViewModelTests.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 7/8/23.
//

import XCTest
@testable import TheMealPrepApp

final class ListViewModelTests: XCTestCase {
    
    var sut: ListViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = RepositoryMock()
        sut = ListViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testListViewModel_whenGetMeals_expectMealsFromApi() throws {
        sut?.getAllMeals()
        XCTAssertNotNil(sut?.meals)
    }

}
