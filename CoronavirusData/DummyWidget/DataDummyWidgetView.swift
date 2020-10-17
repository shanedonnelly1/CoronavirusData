//
//  DataDummyWidgetView.swift
//  CoronavirusData
//
//  Created by Shane on 17/10/2020.
//

import SwiftUI

struct DataDummyWidgetView: View {
    let country: CoronavirusCountryDataValue
    var body: some View {
        Section {
            Text("\(country.location)")
                .font(.headline)
            Text("Total Deaths: \(country.latestTotalDeathsString)")
                .font(.caption)
            Text("Total Cases:  \(country.latestTotalCasesString)")
                .font(.caption)
        }
    }
}

//struct DataDummyWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataDummyWidgetView(country: CoronavirusData())
//    }
//}
