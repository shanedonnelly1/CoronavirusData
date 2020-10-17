//
//  DataDummyWidgetView.swift
//  CoronavirusData
//
//  Created by Shane on 17/10/2020.
//

import SwiftUI

struct CountryStatusNumericDataView: View {
    let country: CoronavirusCountryDataValue
    var body: some View {
        Section {
            Text("\(country.location)")
                .font(.headline)
            
            HStack {
                Text("Total Deaths:")
                Spacer()
                Text(country.latestTotalDeathsString)
            }
            .font(.caption)
            
            HStack {
                Text("Total Cases:")
                Spacer()
                Text(country.latestTotalCasesString)

            }
            .font(.caption)
        }
    }
}

//struct CountryStatusNumericDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryStatusNumericDataView(country: CoronavirusData())
//    }
//}
