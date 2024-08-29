//
//  AcrosticDetailView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import SwiftUI

struct AcrosticDetailView: View {
    
    //
    var acrostic: Acrostic
    @Binding var showing: Bool
    @State private var safari = false
    // @State private var ref = Scripture(book: "", chapter: 0, start: 0, end: 0)

    //
    var body: some View {
        //
        VStack {
            HStack {
                Spacer()
                Button {
                    showing = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            
            //
            AcrosticItemView(acrostic: acrostic,
                             horizontal: .constant(false))
            
            //
            Text(acrostic.text)
                .font(.body)
                .padding(.horizontal)
            
            //http
            List {
                //
                Text("📖 More references")
                //
                ForEach(reference(type: acrostic.type)) { scripture in
                    Link(scripture.title(), destination: URL(string: scripture.esv())!)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    AcrosticDetailView(acrostic: Sample.acrostic, showing: .constant(false))
        .preferredColorScheme(.dark)
}
