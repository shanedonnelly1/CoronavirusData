//
//  DummyWidgetView.swift
//  CoronavirusData
//
//  Created by Shane on 16/10/2020.
//

import SwiftUI

struct DummyWidgetView: View {
    let countryData: CoronavirusData = Bundle.main.decode("owid-covid-data.json")
    var country: CoronavirusCountryDataValue?
    
    var hasCountryData: Bool {
        return country != nil
    }

    var body: some View {
        VStack(alignment: .leading) {
            if hasCountryData == false {
                Section {
                    Text("No data")
                        .font(.headline)
                }
            } else {
                Section {
                    Text("\(country!.location)")
                        .font(.headline)
                    Text("Total Deaths: \(country!.latestTotalDeathsString)")
                        .font(.caption)
                    Text("Total Cases:  \(country!.latestTotalCasesString)")
                        .font(.caption)
                }
            }
        }
    }
    
    init() {
        country = countryData["GBR"]
    }
}

struct DummyWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        DummyWidgetView()
    }
}
