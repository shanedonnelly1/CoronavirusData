//
//  DayInfo.swift
//  CoronavirusData
//
//  Created by Shane on 28/09/2020.
//

import Foundation

struct DayInfo: Codable {
    let value: Double
    let date: Date
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}
