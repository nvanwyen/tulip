//
//  PrayerEmptyView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/7/24.
//

import SwiftUI

struct PrayerEmptyView: View {
    var body: some View {
        ZStack {
            //
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            //
            VStack {
                //
                Text( "No prayers added yet, but remember ...")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
                //
                Image("prayer-chart")
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.5
                    }
                    .cornerRadius(12)
                    .padding()

                //
                Text( "Press the + above to start")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .italic()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
            }
            .offset(y: -61)
        }
    }
}

#Preview {
    PrayerEmptyView()
        .preferredColorScheme(.dark)
}
