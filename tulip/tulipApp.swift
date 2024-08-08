//
//  tulipApp.swift
//  tulip
//
//  Created by Nicholas Van Wyen on 8/4/24.
//

import SwiftUI
import SwiftData

//
@objc class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Application Launched")
        return true
    }

}

@main
struct tulipApp: App {
    //
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    //
    var sharedModelContainer: ModelContainer = {
        
        //
        let schema = Schema([
            Prayer.self,
        ])

        //
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        //
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    //
    var body: some Scene {
        WindowGroup {
            //
            AppView()
        }
        .modelContainer(sharedModelContainer)
    }
}
