//
//  NetworkWeatherManagerTests.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 18.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI

final class NetworkWeatherManagerTests: XCTestCase {
    var networkWeatherManager: NetworkWeatherManager!

    override func setUp() {
        super.setUp()
         networkWeatherManager = NetworkWeatherManager.shared
    }

    override func tearDown(){
        networkWeatherManager = nil
          super.tearDown()
    }

    func testFetchCurrentWeatherWithCityName() {
        let expectation = self.expectation(description: "Fetching weather data")
       
        networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: "London")) { 
            result in
            switch result {
            case .success(let weatherModel):
                XCTAssertNotNil(weatherModel)
            case .failure(let error):
                XCTFail("Failed to fetch weather data with city name. Error: \(error.localizedDescription)")
            }
           
            expectation.fulfill()
        }
       
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchCurrentWeatherWithCoordinate() {
        let expectation = self.expectation(description: "Fetching weather data")
       
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: 51.5085300, longitude: -0.1257400)) { result in
            switch result {
            case .success(let weatherModel):
                XCTAssertNotNil(weatherModel)
            case .failure(let error):
                XCTFail("Failed to fetch weather data with coordinates. Error: \(error.localizedDescription)")
            }
           
            expectation.fulfill()
        }
       
        waitForExpectations(timeout: 5, handler: nil)
    }

}
