import SwiftUI
import AppIntents

enum CarTheme: String, CaseIterable, Identifiable, AppEnum {
    case mPower, night, sportRed, iceBlue
    var id: String { rawValue }

    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Temă"
    static let caseDisplayRepresentations: [CarTheme: DisplayRepresentation] = [
        .mPower: "M Power", .night: "Night", .sportRed: "Sport Red", .iceBlue: "Ice Blue"
    ]

    var name: String {
        switch self {
        case .mPower: "M POWER"
        case .night: "NIGHT"
        case .sportRed: "SPORT"
        case .iceBlue: "ICE"
        }
    }
    var accent: Color {
        switch self {
        case .mPower: Color(red: 0.25, green: 0.55, blue: 1.0)
        case .night: Color(red: 0.7, green: 0.7, blue: 0.8)
        case .sportRed: Color(red: 0.95, green: 0.15, blue: 0.2)
        case .iceBlue: Color(red: 0.5, green: 0.9, blue: 1.0)
        }
    }
    var background: LinearGradient {
        let c: [Color]
        switch self {
        case .mPower: c = [Color(red: 0.02, green: 0.07, blue: 0.22), .black]
        case .night: c = [Color(white: 0.14), .black]
        case .sportRed: c = [Color(red: 0.25, green: 0.02, blue: 0.04), .black]
        case .iceBlue: c = [Color(red: 0.03, green: 0.15, blue: 0.22), .black]
        }
        return LinearGradient(colors: c, startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

/// Three slanted stripes (light blue / dark blue / red)
struct Stripes: View {
    var body: some View {
        HStack(spacing: 3) {
            ForEach([Color(red: 0.35, green: 0.6, blue: 0.95),
                     Color(red: 0.1, green: 0.2, blue: 0.65),
                     Color(red: 0.85, green: 0.1, blue: 0.15)], id: \.self) { c in
                Rectangle().fill(c).frame(width: 7).transform(CGAffineTransform(a: 1, b: 0, c: -0.35, d: 1, tx: 0, ty: 0))
            }
        }
        .frame(height: 22)
    }
}

/// Content shared by the widget and the wallpaper preview
struct ThemeCard: View {
    let theme: CarTheme
    let date: Date
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Stripes()
                Text(theme.name)
                    .font(.system(size: 13, weight: .heavy, design: .rounded))
                    .foregroundStyle(theme.accent)
                    .tracking(2)
                Spacer()
            }
            Spacer()
            Text(date, style: .time)
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.5)
                .foregroundStyle(.white)
            Text(date.formatted(.dateTime.weekday(.wide).day().month(.abbreviated)))
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.white.opacity(0.7))
            Capsule().fill(theme.accent).frame(height: 3)
                .shadow(color: theme.accent, radius: 6)
        }
        .padding(2)
    }
}
