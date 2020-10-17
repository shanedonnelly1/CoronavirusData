//
//  ContentView.swift
//  CoronavirusData
//
//  Created by Shane on 27/09/2020.
//

import SwiftUI

struct ContentView: View {
    let countryData: CoronavirusData = Bundle.main.decode("owid-covid-data.json")
    let countries: [CoronavirusCountryDataValue]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id:\.location) { country in
                    NavigationLink(
                        destination: CountryDetailView(country: country)
                    ) {
                        VStack(alignment: .leading) {
                            Text("\(country.location)")
                                .font(.body)
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
                        }
                        .font(.caption)
                    }
                }
            }
            .navigationBarTitle("Coronavirus Data")
        }
        
    }
    
    init() {
        // Get a sorted array back from the dict for countryData
        countries = countryData.map { $1 }.sorted { $0.location < $1.location }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
