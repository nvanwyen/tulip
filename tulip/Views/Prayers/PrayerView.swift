//
//  PrayerView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/5/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct PrayerView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var prayers: [Prayer]
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                List {
                    ForEach(prayers) { prayer in
                        NavigationLink(destination:
                                PrayerItemEdit(prayer: prayer)) {   // editor
                                PrayerItemView(prayer: prayer)      // list view
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                
                if ( prayers.isEmpty ) {
                    PrayerEmptyView()
                }
            }
            .navigationTitle("🙏 Prayer List")

        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Prayer(date: Date.now, title: "", text: "", done: false, praise: true)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(prayers[index])
            }
        }
    }
}

#Preview {
    PrayerView()
        .modelContainer(for: Prayer.self, inMemory: true)
}
