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
        let expectation = XCTestExpectation(description: "Error")
        sut?.getAllMeals() {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssertNotNil(sut?.meals, "Error: Meals")
        XCTAssertNotEqual(sut?.meals.count, 0, "Error: No meals")
    }
    
    func testFilteredMealsComputedProperty_whenFilterMeals_expectMeals() throws {
        let meals = [Meal(id: "1", image: URL(string: "image1")!, name: "name1", instructions: "ins1", area: "American", tags: "", videoUrl: ""),
        Meal(id: "2", image: URL(string: "image1")!, name: "name2", instructions: "inst2", area: "British", tags: "", videoUrl: ""),
        Meal(id: "3", image: URL(string: "image3")!, name: "name3", instructions: "inst3", area: "Spanish", tags: "", videoUrl: "")
        ]
        
        let listViewModel = ListViewModel(repository: RepositoryMock())
        listViewModel.meals = meals
        listViewModel.filterOption = .american
        
        XCTAssertNotNil(listViewModel.meals.first)
        XCTAssertEqual(listViewModel.filteredMeals.first?.name, "name1")
        
        listViewModel.filterOption = .unknown
        XCTAssertEqual(listViewModel.filteredMeals.count, 0)
    }
    
    func testSearchMealsComputedProperty_whenSearchMeals_expectMealSearched() throws {
        let meals = [Meal(id: "1", image: URL(string: "image1")!, name: "name1", instructions: "ins1", area: "American", tags: "", videoUrl: ""),
        Meal(id: "2", image: URL(string: "image1")!, name: "name2", instructions: "inst2", area: "British", tags: "", videoUrl: ""),
        Meal(id: "3", image: URL(string: "image3")!, name: "name3", instructions: "inst3", area: "Spanish", tags: "", videoUrl: "")
        ]
        sut?.meals = meals
        sut?.filterOption = .none
        sut?.searchText = "name1"
        
        let expectation = XCTestExpectation(description: "Error")
        
        XCTAssertNotNil(sut?.searchedMeals.first, "Error: There are no meals with that search")
        XCTAssertEqual(sut?.searchedMeals.first?.name, "name1")
        XCTAssertEqual(sut?.searchedMeals.count, 1, "Error: The number of meals does not match")
        
    }
    
    
    func testSearchMealsComputedProperty_whenSearcheMeals_expectEmptySearch() throws {
        let meals = [Meal(id: "1", image: URL(string: "image1")!, name: "name1", instructions: "ins1", area: "American", tags: "", videoUrl: ""),
        Meal(id: "2", image: URL(string: "image1")!, name: "name2", instructions: "inst2", area: "British", tags: "", videoUrl: ""),
        Meal(id: "3", image: URL(string: "image3")!, name: "name3", instructions: "inst3", area: "Spanish", tags: "", videoUrl: "")
        ]
        let listViewModel = ListViewModel(repository: RepositoryMock())
        listViewModel.meals = meals
        listViewModel.filterOption = .none
        listViewModel.searchText = ""
        
        XCTAssertEqual(listViewModel.searchedMeals.count, 3, "Error: The search return all the meals because is empty")
    }
    
}
