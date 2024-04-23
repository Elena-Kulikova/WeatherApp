//
//  CurrentWeatherViewTests.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 22.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI

final class CurrentWeatherViewTests: XCTestCase {
       
        var currentWeatherView: CurrentWeatherView!
        override func setUp() {
            super.setUp()
            currentWeatherView = CurrentWeatherView()
        }
        override func tearDown() {
            currentWeatherView = nil
            super.tearDown()
        }
    
        func testSetupDataFor() {
            let city = "New York"
            let temperature = "75°"
            let conditionCode = 800
            currentWeatherView.setupDataFor(cityLabel: city, tempLabel: temperature, conditionCode: conditionCode)
            XCTAssertEqual(currentWeatherView.cityLabel.text, city)
            XCTAssertEqual(currentWeatherView.tempLabel.text, temperature)
        }
       
        func testCityLabelFontSize() {
            XCTAssertEqual(currentWeatherView.cityLabel.font.pointSize, currentWeatherView.cityLabelFontSize)
        }
       
        func testTempLabelFontSize() {
            XCTAssertEqual(currentWeatherView.tempLabel.font.pointSize, currentWeatherView.tempLabelFontSize)
        }
}

