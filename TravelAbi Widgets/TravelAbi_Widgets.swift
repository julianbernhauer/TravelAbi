//
//  TravelAbi_Widgets.swift
//  TravelAbi Widgets
//
//  Created by Julian Bernhauer on 22.05.23.
//

import WidgetKit
import SwiftUI
import Intents
import CoreData

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct TravelAbi_WidgetsEntryView : View {
        @Environment(\.widgetFamily) var widgetFamily
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var fetchFlights: FetchedResults<Flights> 
        var body: some View {
        switch widgetFamily {
        case .accessoryCircular:
            VStack {
                Gauge(value: 0.75) {
                    Text("3/4")
                }
                .gaugeStyle(.accessoryCircularCapacity)
            }
        case .accessoryInline:
            Text("ur mom")
        case .accessoryRectangular:
            VStack {

                    HStack {
                        Image(systemName: "airplane.departure")
                        Text("2")
                            .font(.headline)
                            .widgetAccentable()
                    
                }
            }
            .privacySensitive()
        default:
            Text("Not yet implemented")
        }
    }
}

struct TravelAbi_Widgets: Widget {
    let kind: String = "TravelAbi_Widgets"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TravelAbi_WidgetsEntryView()
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TravelAbi_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        TravelAbi_WidgetsEntryView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
