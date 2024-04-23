//
//  Extension + Int.swift
//  WeatherAppOpenAPI
//
//  Created by Elena on 04.04.2024.
//

import Foundation

extension Int {
    func toDateFormatted(withDayOfWeek: Bool = false) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        
        if withDayOfWeek {
            dateFormatter.dateFormat = "EE"
        } else {
            dateFormatter.dateFormat = "dd.MM"
        }
        
        return dateFormatter.string(from: date)
    }
}
