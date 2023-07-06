//
//  AuthViewModel.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/28/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticatoinFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, passsword: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: passsword)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
        
    }
    
    func createUser(isAdmin:Bool, withEmail email: String, password: String, firstName: String, lastName: String, isCheckedIn: Bool, rating: Int) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, isAdmin: false, firstName: firstName, lastName: lastName, email: email, isCheckedIn: false, rating: 0)
            let encodedUser = try Firestore.Encoder().encode(user) 
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("Debug: Failed to create user with error \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    func deleteAccount() {
        guard let user = Auth.auth().currentUser  else {
            return
        }
        
        user.delete { error in
            if let error = error {
                print("Error deleting account: ", error.localizedDescription)
            } else {
                self.userSession = nil
                self.currentUser = nil
                print("User account deleted")
            }
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument()
                                else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
    
    func checkUserIn(isCheckedIn: Bool) async {
        guard var currentUser = currentUser else {
            return
        }
        
        do {
            currentUser.isCheckedIn = isCheckedIn
            let encodedUser = try Firestore.Encoder().encode(currentUser)
            try await Firestore.firestore().collection("users").document(currentUser.id).setData(encodedUser, merge: true)
            print("User isCheckedIn updated successfully")
        } catch {
            print("Error updating isCheckedIn: \(error.localizedDescription)")
        }
    }
    
    func setUserRating(rating: String) async {
        guard var currentUser = currentUser else {
            return
        }
        
        do {
            currentUser.rating = Int(rating) ?? 0
            let encodedUser = try Firestore.Encoder().encode(currentUser)
            try await Firestore.firestore().collection("users").document(currentUser.id).setData(encodedUser, merge: true)
            print("User rating updated successfully")
            await fetchUser()
        } catch {
            print("Error updating rating: \(error.localizedDescription)")
        }
    }

}
