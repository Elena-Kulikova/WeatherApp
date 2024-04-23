//
//  NetworkServiceProtocol.swift
//  WeatherAppOpenAPI
//
//  Created by Elena on 04.04.2024.
//

import Foundation
protocol NetworkServiceProtocol: AnyObject {
    func fetchCurrentWeather(forRequestType requestType: RequestType, completion: @escaping (Result<WeatherModel, Error>) -> Void)
}
