//
//  AppView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/5/24.
//

import SwiftUI
import SwiftData

struct AppView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var prayer: [Prayer]

    //
    var body: some View {
        TabView {
            //
            DoctrineView()
                .tabItem {
                    Label("Doctrine", systemImage: "book")
                }

            //
            PrayerView()
                .tabItem {
                    Label("Prayers", systemImage: "list.clipboard")
                }
                .badge(prayer.filter({ $0.done == false }).count )

            //
            SermonView()
                .tabItem {
                    Label("Sermons", systemImage: "mic")
                }
        }
    }
}

#Preview {
    AppView()
        .preferredColorScheme(.dark)
}
