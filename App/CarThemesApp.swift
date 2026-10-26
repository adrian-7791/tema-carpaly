import UIKit
import SwiftUI
import UIKit

@main
struct CarThemesApp: App {
    var body: some Scene { WindowGroup { ContentView() } }
}

struct ContentView: View {
    @State private var saved: CarTheme?

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(CarTheme.allCases) { theme in
                        VStack(spacing: 10) {
                            wallpaper(theme)
                                .frame(width: 360, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                            Button(saved == theme ? "Salvat în Poze ✓" : "Salvează wallpaper") {
                                save(theme)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(theme.accent)
                        }
                    }
                }
                .padding()
            }
            .background(Color.black)
            .navigationTitle("Car Themes")
        }
        .preferredColorScheme(.dark)
    }

    func wallpaper(_ theme: CarTheme) -> some View {
        ZStack {
            theme.background
            ThemeCard(theme: theme, date: .now).padding(24)
        }
    }

    @MainActor func save(_ theme: CarTheme) {
        let r = ImageRenderer(content: wallpaper(theme).frame(width: 1920, height: 720))
        r.scale = 1
        if let img = r.uiImage {
            UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
            saved = theme
        }
    }
}
