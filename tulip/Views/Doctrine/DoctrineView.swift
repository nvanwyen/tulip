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
                    Link("Canons of Dort", destination: URL(string: "https://www.crcna.org/welcome/beliefs/confessions/canons-dort#toc-conclusion-to-top")!)
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Link("Expository focus", destination: URL(string: "https://www.youtube.com/playlist?list=PLtFxpnZIgB5Ak6HYcifcV7ulREorKDjYN")!)
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
