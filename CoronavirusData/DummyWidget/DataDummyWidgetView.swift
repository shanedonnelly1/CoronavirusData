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

//struct DataDummyWidgetView_Previews: PreviewProvider {
//    static var previews: some View {
//        DataDummyWidgetView(country: CoronavirusData())
//    }
//}
