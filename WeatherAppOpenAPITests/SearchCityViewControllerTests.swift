//
//  SearchCityViewControllerTests.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 22.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI
import MapKit


final class SearchCityViewControllerTests: XCTestCase {

    var searchCityVC: SearchCityViewController!
   
    override func setUp() {
        super.setUp()
        searchCityVC = SearchCityViewController()
    }
   
    override func tearDown() {
        searchCityVC = nil
        super.tearDown()
    }

    func testDidSelectSearchResult() {
        let cityName = "New York"
       
        class MockDelegate: SearchCityViewControllerDelegate {
            var selectedCityName: String?
           
            func didCitySelected(cityName: String) {
                selectedCityName = cityName
            }
        }
       
        let mockDelegate = MockDelegate()
        searchCityVC.cityDelegate = mockDelegate
       
        searchCityVC.didSelectSearchResult(cityName)
       
        XCTAssertEqual(mockDelegate.selectedCityName, cityName, "Selected city name should be \(cityName)")
    }
    
    func testSearchBarTextDidChange() {
        
        let searchText = "New York"
        
        searchCityVC.searchBar(UISearchBar(), textDidChange: searchText)
        
        XCTAssertEqual(searchCityVC.searchCompleter.queryFragment, searchText)
    }
}


