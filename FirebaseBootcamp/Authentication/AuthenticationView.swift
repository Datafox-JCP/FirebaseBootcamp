//
//  AuthenticationView.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 02/04/23.
//

import SwiftUI

// 1 esta es el primer view
struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Ingresar con Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        } // VStack
        .padding()
        .navigationTitle("Ingresar")
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()
        }
    }
}
