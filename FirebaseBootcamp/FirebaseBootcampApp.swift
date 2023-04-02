//
//  FirebaseBootcampApp.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 02/04/23.
//

import SwiftUI
import FirebaseCore

@main
struct FirebaseBootcampApp: App {
    
    /// Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    ///  Firebase setup without delegate
//    init() {
//        FirebaseApp.configure()
//        print("Cinfigured Forebase!")
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
