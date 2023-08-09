//
//  RootViewModelTests.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 7/8/23.
//

import XCTest
@testable import TheMealPrepApp

final class RootViewModelTests: XCTestCase {
    
    var sut: RootViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = RepositoryMock()
        sut = RootViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRootViewModel_whenOnClick_expectStatusLoaded() throws {
        sut?.onClick()
        XCTAssertEqual(sut?.status, .loaded)
    }
    
    
    func testRootViewModel_whenGoToHome_expectStatusDefault() {
        sut?.goToHome()
        XCTAssertEqual(sut?.status, .default)
    }
}
