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
                    VStack(alignment: .leading) {
                        Text("\(country.location)")
                        HStack {
                            Text("Total Deaths: ")
                                .font(.caption)
                            Spacer()
                            Text(country.latestTotalDeathsString)
                                .font(.caption)
                        }
                        HStack {
                            Text("Total Cases: ")
                                .font(.caption)
                            Spacer()
                            Text(country.latestTotalCasesString)
                                .font(.caption)
                            
                        }
                        if let data = country.latestData {
                            HStack {
                                Text("Latest data from: ")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("\(data.date)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Coronavirus Data")
        }
        
    }
    
    init() {
        countries = countryData.map { $1 }
        // @Todo order by country.location Ascending
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
