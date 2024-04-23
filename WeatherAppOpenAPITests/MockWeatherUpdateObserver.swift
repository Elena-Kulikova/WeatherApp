//
//  MockWeatherUpdateObserver.swift
//  WeatherAppOpenAPITests
//
//  Created by Elena on 20.04.2024.
//

import Foundation
@testable import WeatherAppOpenAPI

class MockWeatherUpdateObserver: WeatherUpdateObserver {
    var didUpdateWeatherDataCalled = false
    var didFailToReceiveWeatherDataCalled = false
    
    func didUpdateWeatherData() {
        didUpdateWeatherDataCalled = true
    }
    
    func didFailToReceiveWeatherData() {
        didFailToReceiveWeatherDataCalled = true
    }
}
