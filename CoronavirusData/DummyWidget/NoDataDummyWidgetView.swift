//
//  NoDataDummyWidgetView.swift
//  CoronavirusData
//
//  Created by Shane on 17/10/2020.
//

import SwiftUI

struct NoDataDummyWidgetView: View {
    var body: some View {
        Section {
            Text("No data")
                .font(.headline)
        }
    }
}

struct NoDataDummyWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataDummyWidgetView()
            .previewLayout(.fixed(width: 160, height: 160))
    }
}
