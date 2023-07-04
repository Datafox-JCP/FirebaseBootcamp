//
//  SignInEmailView.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 02/04/23.
//

import SwiftUI

// 1 esta es la segunda ventana

// 2 crear la class
@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    // 4 definir las propiedades
    @Published var email = ""
    @Published var password = ""
    
    // 7 después de crear AuthenticationManager va esta función
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No se encontraron el correo o la clave")
            return
        }
        
        Task {
            do {
              let returnedUserData = try await  AuthenticationManager.shared.createUser(email: email, password: password)
                print("Exito")
                print(returnedUserData)
            } catch {
                print("Error \(error)")
            }
        }
    }
}

struct SignInEmailView: View {
    // 3 cargar el viewmodel
    // MARK: Properties
    @StateObject private var viewModel = SignInEmailViewModel()
    
    // MARK: View
    var body: some View {
        VStack {
            // 6 colocar los texts y botón
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(12)
            
            SecureField("Clave...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(12)
            
            Button {
                // 8 llamar la función y probar ejecutando
                // hay que cambiar el archivo app
                viewModel.signIn()
                // una vez probado crear rootview
            } label: {
                Text("Ingresar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
            // después de esto crear AuthenticationManager
            
        } // VStack
        .padding()
        // 5 colocar el título dentro de un VStack
        .navigationTitle("Ingresar con Email")
    }
}

// MARK: Preview
struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        // 5 colocar el navigationstack y el título arriba
        NavigationStack {
            SignInEmailView()
        }
    }
}
