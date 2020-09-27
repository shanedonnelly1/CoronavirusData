// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
struct Datum: Codable {
    let date: String
    let totalCases, newCases, totalDeaths, newDeaths: Int?

    enum CodingKeys: String, CodingKey {
        case date
        case totalCases = "total_cases"
        case newCases = "new_cases"
        case totalDeaths = "total_deaths"
        case newDeaths = "new_deaths"
    }
}
