//
//  CoronavirusDataWidget.swift
//  CoronavirusDataWidget
//
//  Created by Shane on 17/10/2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date())]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CoronavirusDataWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CountryStatusNumericView()
    }
}

@main
struct CoronavirusDataWidget: Widget {
    let kind: String = "CoronavirusDataWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CoronavirusDataWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Coronavirus Country Data")
        .description("Keep an eye on the Coronavirus Data in your country.")
        .supportedFamilies([.systemSmall])
    }
}

struct CoronavirusDataWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryStatusNumericView()
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            CountryStatusNumericView()
                .redacted(reason: .placeholder)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
