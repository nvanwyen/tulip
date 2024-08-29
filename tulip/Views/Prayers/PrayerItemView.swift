//
//  PrayerItemView.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/7/24.
//

import SwiftUI

struct PrayerItemView: View {
    //
    var prayer: Prayer
    
    var body: some View {
        ZStack {
            HStack {
                //
                Image(systemName: prayer.praise ? "figure.wave.circle" : "figure.2.circle")
                    .imageScale(.large)
                    .foregroundColor(prayer.done ? .secondary : .primary)
                    .padding(.trailing)

                //
                VStack(alignment: .leading) {
                    //
                    Text(prayer.date.formatted(date: .abbreviated, time: .omitted))
                        .italic(prayer.done || prayer.title.isEmpty)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(prayer.done ? .secondary : .primary)
                    //
                    Text(prayer.date.formatted(date: .omitted, time: .shortened))
                        .italic(prayer.done || prayer.title.isEmpty)
                        .font(.body)
                        .foregroundColor(prayer.done ? .secondary : .primary)
                }
                .padding(.trailing)
                
                //
                VStack(alignment: .leading) {
                    //
                    Text(prayer.title.isEmpty ? "New" : prayer.title)
                        .lineLimit(1)
                        .italic(prayer.done || prayer.title.isEmpty)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(prayer.done ? .secondary : .primary)

                    //
                    Text(prayer.title.isEmpty ? "Select to edit" : prayer.text)
                        .lineLimit(1)
                        .italic(prayer.done || prayer.title.isEmpty)
                        .font(.body)
                        .foregroundColor(prayer.done ? .secondary : .primary)
                }
            }
        }
    }
}

#Preview {
    PrayerItemView(prayer: Sample.prayer)
        .preferredColorScheme(.dark)
}
