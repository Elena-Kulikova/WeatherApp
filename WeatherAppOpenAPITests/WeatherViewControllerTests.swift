//
//  WeatherViewControllerTests.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 22.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI

final class WeatherViewControllerTests: XCTestCase {

    var sut: WeatherViewController!
  
     override func setUp() {
         super.setUp()
         sut = WeatherViewController()
     }
  
     override func tearDown() {
         sut = nil
         super.tearDown()
     }
  
     func testWeatherViewModelInitialization() {
         XCTAssertNotNil(sut.viewModel)
     }
  
     func testScrollViewIsNotNilAfterViewDidLoad() {
         _ = sut.view // вызываем viewDidLoad
         XCTAssertNotNil(sut.scrollView)
     }
  
     func testContentViewIsAddedToScrollView() {
         _ = sut.view // вызываем viewDidLoad
         XCTAssertTrue(sut.contentView.isDescendant(of: sut.scrollView))
     }
  
     func testDidFailToReceiveWeatherData() {
         sut.didFailToReceiveWeatherData()
         // Проверяем, что alertController не был показан
         XCTAssertFalse(sut.presentedViewController is UIAlertController)
     }

}
