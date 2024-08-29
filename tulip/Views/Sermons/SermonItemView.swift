//
//  SermonItemView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/7/24.
//

import SwiftUI

struct SermonItemView: View {
    //
    let sermon: Sermon

    //
    var body: some View {
        HStack {
            Image(sermon.image)
                .resizable()
                .frame(width: 52, height: 52)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(sermon.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .scaledToFit()
                    .minimumScaleFactor(0.3)
                Text(sermon.pastor)
                    .font(.caption)
                Text(sermon.church)
                    .font(.caption2)
                    .italic()
            }
        }
    }
}

#Preview {
    SermonItemView(sermon: Sample.sermon)
        .preferredColorScheme(.dark)
}
