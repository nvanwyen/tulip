//
//  Badge.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/7/24.
//

import SwiftUI

//
protocol BadgeNumberProvidable: AnyObject {
    var applicationIconBadgeNumber: Int { get set }
}

//
extension UIApplication: BadgeNumberProvidable {}

//
actor AppAlertBadgeManager {
    //
    let application: BadgeNumberProvidable

    //
    init(application: BadgeNumberProvidable) {
        self.application = application
    }

    @MainActor
    func setAlertBadge(number: Int) {
        application.applicationIconBadgeNumber = number
    }

    @MainActor
    func resetAlertBadge() {
        application.applicationIconBadgeNumber = 0
    }
}
