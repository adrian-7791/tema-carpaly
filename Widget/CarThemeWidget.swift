import WidgetKit
import SwiftUI
import AppIntents

struct ThemeIntent: WidgetConfigurationIntent {
    static let title: LocalizedStringResource = "Temă"
    @Parameter(title: "Temă", default: .mPower) var theme: CarTheme
}

struct ThemeEntry: TimelineEntry {
    let date: Date
    let theme: CarTheme
}

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> ThemeEntry { ThemeEntry(date: .now, theme: .mPower) }
    func snapshot(for c: ThemeIntent, in context: Context) async -> ThemeEntry { ThemeEntry(date: .now, theme: c.theme) }
    func timeline(for c: ThemeIntent, in context: Context) async -> Timeline<ThemeEntry> {
        let now = Date()
        let entries = (0..<60).map { ThemeEntry(date: now.addingTimeInterval(Double($0) * 60), theme: c.theme) }
        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct CarThemeWidget: Widget {
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: "CarThemeWidget", intent: ThemeIntent.self, provider: Provider()) { e in
            ThemeCard(theme: e.theme, date: e.date)
                .containerBackground(for: .widget) { e.theme.background }
        }
        .configurationDisplayName("Car Theme")
        .description("Ceas și temă stil sport pentru CarPlay.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

@main
struct CarWidgetBundle: WidgetBundle {
    var body: some Widget { CarThemeWidget() }
}
