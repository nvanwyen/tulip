//
//  AcrosticViewItem.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import SwiftUI

//
struct AcrosticItemView: View {
 
    //
    let acrostic: Acrostic
    @Binding var horizontal: Bool

    //
    var body: some View {
        //
        if ( horizontal ) {
            HAcrosticItemView(acrostic: acrostic)
                .padding()
        } else {
            VAcrosticItemView(acrostic: acrostic)
                .padding()
        }
    }
}

//
struct HAcrosticItemView: View {
    //
    let acrostic: Acrostic

    //
    var body: some View {
        HStack {
            Image(acrostic.image)
                .resizable()
                .frame(width: 52, height: 52)
                .padding(.trailing)
            Text(acrostic.title)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .scaledToFit()
                .minimumScaleFactor(0.3)
        }
    }
}

//
struct VAcrosticItemView: View {
    //
    let acrostic: Acrostic

    //
    var body: some View {
        VStack {
            Image(acrostic.image)
                .resizable()
                .frame(width: 75, height: 75)
            Text(acrostic.title)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(width: 120, height: 35)
                .scaledToFit()
                .minimumScaleFactor(0.7)
        }
    }
}

//
#Preview {
    AcrosticItemView(acrostic: Sample.acrostic, horizontal: .constant(true))
        .preferredColorScheme(.dark)
}
