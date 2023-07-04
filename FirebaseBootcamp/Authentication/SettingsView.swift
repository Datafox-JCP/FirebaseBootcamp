//
//  SettingsView.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 12/04/23.
//

import SwiftUI

// 3 crear esta viewmodel
@MainActor
final class SettingsViewModel: ObservableObject {
    
    // 4 ir a AuthenticationManager y volver al tener signOut
    // para completarlo
    func logout() throws {
        try AuthenticationManager.shared.signOut()
    }
}

struct SettingsView: View {
    
    // 5
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSigInView: Bool
    
    var body: some View {
        // 1 Lista y botón vacio
        List {
            Button("Cerrar sesión") {
                Task {
                    // 6 y pasar a rootview
                    // después ajustar el preview
                    do {
                        try viewModel.logout()
                        showSigInView = true
                    } catch {
                        print(error)
                    }
                }
            }
        } // List
        // 2 título
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView(showSigInView: .constant(false))
        }
    }
}
