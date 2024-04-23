//
//  WeatherAppOpenAPIUITests.swift
//  WeatherAppOpenAPIUITests
//
//  Created by Elena on 04.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI

final class WeatherAppOpenAPIUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()

    }
    
    func testTabClick(){
        
        let app = XCUIApplication()
        let toolbar = app.toolbars["Toolbar"]
        toolbar.buttons["location services"].tap()
        toolbar.buttons["Search"].tap()
        app.searchFields["Enter city name"].tap()
        
    }
  
}
