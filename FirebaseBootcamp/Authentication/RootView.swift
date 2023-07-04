//
//  RootView.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 12/04/23.
//

import SwiftUI

struct RootView: View {
    
    // 3
    @State private var showSignInView: Bool = false
    
    var body: some View {
        // 1
        ZStack {
            NavigationStack {
//                Text("Settings") // esto va antes de crear SettingsView
                // 7 y volver a Settings
                SettingsView(showSigInView: $showSignInView)
            }
        } // ZStack
        // 5 poner el onAppear y pasar AuthenticationManager
        // para crear la función
        .onAppear {
            // 6
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
            // probar y crear SettingsView
        }
        // 2
        .fullScreenCover(isPresented: $showSignInView) {
            // 4
            NavigationStack {
                AuthenticationView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
