//
//  WeatherViewModelTests.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 18.04.2024.
//

import XCTest
@testable import WeatherAppOpenAPI


final class WeatherViewModelTests: XCTestCase {
    var weatherViewModel: WeatherViewModel!
    
    override func setUp() {
        super.setUp()
        weatherViewModel = WeatherViewModel(networkManager: NetworkWeatherManager.shared,
                                            userDefaults: UserDefaults.standard)
    }
    override func tearDown() {
        weatherViewModel = nil
        super.tearDown()
    }
    
    func testAddObserver() {
        let observer = MockWeatherUpdateObserver()
        weatherViewModel.addObserver(observer)
        
        XCTAssertTrue(weatherViewModel.observers.contains { $0 === observer })
    }
    
    func testRemoveObserver() {
        let observer = MockWeatherUpdateObserver()
        weatherViewModel.addObserver(observer)
        weatherViewModel.removeObserver(observer)
        
        XCTAssertFalse(weatherViewModel.observers.contains { $0 === observer })
    }
    
    func testWeatherViewModelNotifyUpdate() {
        let observer = MockWeatherUpdateObserver()
        let viewModel = WeatherViewModel()
        
        // Добавляем MockWeatherUpdateObserver в качестве наблюдателя
        viewModel.addObserver(observer)
        
        // Вызываем метод, который уведомляет о обновлении данных погоды
        viewModel.notifyWeatherDataUpdate()
        
        // Проверяем, что метод didUpdateWeatherData был вызван у MockWeatherUpdateObserver
        XCTAssertTrue(observer.didUpdateWeatherDataCalled)
    }
}



