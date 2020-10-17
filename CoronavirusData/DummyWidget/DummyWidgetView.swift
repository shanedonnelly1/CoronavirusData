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
    
    var body: some View {
        VStack(alignment: .leading) {
            if country == nil {
                NoDataDummyWidgetView()
            } else {
                DataDummyWidgetView(country: country!)
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
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
