//
//  ContentView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/4/24.
//

import SwiftUI
import SwiftData

struct SermonView: View {
    var body: some View {
        NavigationView {
            List(References.resource) { sermon in
                SermonItemView(sermon: sermon)
                    .padding(.top)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: sermon.link)!)
                    }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowSpacing(7)
            .navigationTitle("🎧 Sermons")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("More sermons", destination: URL(string: "https://www.youtube.com/@SGFCJax"
                                                               // "https://sgfcjax.org/sermons/"
                                                         )!)
                }
            }
        }
        
    }
}

#Preview {
    SermonView()
        .preferredColorScheme(.dark)
}
