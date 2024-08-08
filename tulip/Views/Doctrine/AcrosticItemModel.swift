//
//  AcrosticItemModel.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/6/24.
//

import SwiftUI

//
final class AcrosticItemModel: ObservableObject {
    //
    var selected: Acrostic? {
        didSet {
            detail = true
        }
    }
    
    //
    @Published var detail = false // displaying detail?
}
