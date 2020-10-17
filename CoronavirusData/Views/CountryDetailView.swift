//
//  CountryDetailView.swift
//  CoronavirusData
//
//  Created by Shane on 17/10/2020.
//

import SwiftUI

struct CountryDetailView: View {
    let country: CoronavirusCountryDataValue
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Total Deaths: ")
                Spacer()
                Text(country.latestTotalDeathsString)
            }
            HStack {
                Text("Total Cases: ")
                Spacer()
                Text(country.latestTotalCasesString)
                
            }
            if let data = country.latestData {
                HStack {
                    Text("Latest data from: ")
                    Spacer()
                    Text("\(data.date)")
                }
                .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(country.location)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static let countryData: CoronavirusData = Bundle.main.decode("owid-covid-data.json")
    static let country = countryData["GBR"]!
    
    static var previews: some View {
        NavigationView {
            CountryDetailView(country: country)
        }
    }
}
