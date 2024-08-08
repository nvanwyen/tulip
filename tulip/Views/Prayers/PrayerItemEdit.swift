//
//  PrayerItemEdit.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/7/24.
//

import SwiftUI

struct PrayerItemEdit: View {
    //
    @State var prayer: Prayer
    @FocusState private var focus: FieldFocus?
    
    enum FieldFocus {
        case title, text
    }

    var body: some View {
        NavigationView {
            Form {
                // Text("Date: " + prayer.date.formatted(date: .abbreviated, time: .shortened))
                DatePicker("Date",selection: $prayer.date, displayedComponents: [.date, .hourAndMinute])
                
                //
                Section(header: Text("Supplication with Thanksgiving")) {
                    //
                    TextField("Title", text: $prayer.title)
                        .autocapitalization(.words)
                        .disableAutocorrection(false)
                        .focused($focus, equals: .title)
                        .onSubmit {
                            focus = .text
                        }
                        .submitLabel(.next)
                    
                    //
                    TextField("Text", text: $prayer.text, axis: .vertical)
                        .autocapitalization(.sentences)
                        .disableAutocorrection(false)
                        .focused($focus, equals: .text)
                        .onSubmit {
                            focus = nil
                        }
                        .submitLabel(.return)

                    //
                    Toggle("Praise", isOn: $prayer.praise)
                }
                
                //
                Toggle("Answered", isOn: $prayer.done)
            }
            .toggleStyle(SwitchToggleStyle(tint: .app))
            .font(.body)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focus = nil
                    }
                }
            }
        }
    }
}

#Preview {
    //
    struct Preview: View {
        //
        @State var prayer: Prayer = Sample.prayer
        //
        var body: some View {
            PrayerItemEdit(prayer: prayer)
        }
    }
    //
    return Preview()
}
