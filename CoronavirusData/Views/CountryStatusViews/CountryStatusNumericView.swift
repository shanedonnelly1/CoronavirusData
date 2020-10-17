//
//  DummyWidgetView.swift
//  CoronavirusData
//
//  Created by Shane on 16/10/2020.
//

import SwiftUI

struct CountryStatusNumericView: View {
    let countryData: CoronavirusData = Bundle.main.decode("owid-covid-data.json")
    var country: CoronavirusCountryDataValue?
    
    var body: some View {
        VStack(alignment: .leading) {
            if country == nil {
                CountryStatusNumericNoDataView()
            } else {
                CountryStatusNumericDataView(country: country!)
            }
        }
        .padding(5)
    }
    
    init() {
        country = countryData["GBR"]
    }
}

struct DummyWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatusNumericView()
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
