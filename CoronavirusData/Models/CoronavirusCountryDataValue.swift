//
//  Country.swift
//  CoronavirusData
//
//  Created by Shane on 27/09/2020.
//

import Foundation

struct CoronavirusCountryDataValue: Codable {
    let continent, location: String
    let population: Int
    let data: [Datum]
    
    var latestData: Datum? {
        return data.last
    }
    
    var latestTotalDeathsString: String {
        if let unwrapped = latestData {
            if let unwrappedTotalDeaths = unwrapped.totalDeaths {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                if let formattedString = formatter.string(from: NSNumber(value: unwrappedTotalDeaths)) {
                    return formattedString
                }
            }
        }
        return ""
    }
    
    var latestTotalCasesString: String {
        if let unwrapped = latestData {
            if let unwrappedTotalCases = unwrapped.totalCases {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                if let formattedString = formatter.string(from: NSNumber(value: unwrappedTotalCases)) {
                    return formattedString
                }
            }
        }
        return ""
    }
    
    enum CodingKeys: String, CodingKey {
        case continent, location, population
        case data
    }
}
