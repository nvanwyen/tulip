//
//  DoctrineView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import SwiftUI

struct DoctrineView: View {
    //
    @StateObject var model = AcrosticItemModel()
        
    //
    var body: some View {
        //
        NavigationView {
            List(Theology.acrostic) { acrostic in
                AcrosticItemView(acrostic: acrostic,
                                 horizontal: .constant(true))
                    .onTapGesture {
                        model.selected = acrostic
                    }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .listRowSpacing(7)
            .navigationTitle("🌷 T.U.L.I.P.")
            .sheet(isPresented: $model.detail) {
                AcrosticDetailView(acrostic: model.selected!,
                                   showing: $model.detail)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("Learn more", destination: URL(string: "https://www.crcna.org/welcome/beliefs/confessions/canons-dort#toc-conclusion-to-top")!)
                }
            }
        }
    }
}

//
#Preview {
    DoctrineView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
