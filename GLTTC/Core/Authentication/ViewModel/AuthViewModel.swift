//
//  AuthViewModel.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/28/23.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, passsword: String) async throws {
        print("Sign in...")
        
    }
    
    func createUser(withEmail email: String, password: String, firstName: String, lastName: String) async throws {
        print("Craeate user")
        
    }
    
    func signOut() {
        
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
}
