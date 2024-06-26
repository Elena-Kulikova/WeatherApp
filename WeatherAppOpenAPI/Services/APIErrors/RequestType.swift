//
//  RequestType.swift
//  WeatherAppOpenAPI
//
//  Created by Elena on 04.04.2024.
//

import Foundation
import CoreLocation

enum RequestType {
    case cityName(city: String)
    case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    
    var cacheKey: String {
        switch self {
        case .cityName(let city):
            return "weather_city_\(city)"
        case .coordinate(let latitude, let longitude):
            return "weather_lat_\(latitude)_lon_\(longitude)"
        }
    }
}
