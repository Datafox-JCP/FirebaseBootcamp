//
//  AuthenticationManager.swift
//  FirebaseBootcamp
//
//  Created by Juan Hernandez Pazos on 12/04/23.
//

import Foundation
import FirebaseAuth
import Firebase

// 4 crear el modelo y regresar a SignInEmailView
struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

// 1 primero se crea la clase
final class AuthenticationManager {
    
    // 2 para crear un singleton
    static let shared = AuthenticationManager()
    private init() { }
    
    // 5 y volver a rootview
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    // 3 crear función
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authtDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authtDataResult.user)
    }
    
    // 6 crear y volver a settings
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
