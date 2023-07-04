//
//  FirebaseBootcampApp.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 02/04/23.
//

import SwiftUI
// 1 importar Firebase
import Firebase

@main
struct FirebaseBootcampApp: App {
    // 4 de la página de Firebase y comentar el init
    /// Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // 2  Firebase sin delegate, probar lanzando el app
//    init() {
//        FirebaseApp.configure()
//        print("¡Firebase configurado!")
//    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
// 3 de la página de Firebase
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
