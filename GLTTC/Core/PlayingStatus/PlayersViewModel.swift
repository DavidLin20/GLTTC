//
//  PlayersViewModel.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 9/27/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class PlayerViewModel: ObservableObject {
    
    // Define your linked list here or use a different data structure
    // For simplicity, let's assume you're using an array
    @Published var waitingList = WaitingList()

    func fetchAndAppendCheckedInUsers() {
        // Create a Firestore reference to the "users" collection
        let db = Firestore.firestore()
        let usersCollection = db.collection("users")
        
        // Query users with isCheckedIn set to true
        usersCollection.whereField("isCheckedIn", isEqualTo: true).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching checked-in users: \(error.localizedDescription)")
                return
            }
            
            // Loop through the query snapshot to add users to the waiting list
//            for document in querySnapshot!.documents {
//                let userData = document.data()
//
//                // Assuming your User class has an initializer that accepts a dictionary
//                if let user = User(data: userData) {
//                    self.waitingList.append(value: user)
//                }
//            }
            
            for document in querySnapshot!.documents {
                            do {
                                // Decode Firestore document directly into User object
                                let user = try document.data(as: User.self)
                                self.waitingList.append(value: user)
                            } catch {
                                print("Error decoding user: \(error.localizedDescription)")
                            }
                        }
            
            // You can now use the waitingList with checked-in users
        }
    }
    
    func displayPlayers() {
            var current = waitingList.head
            while let node = current {
                print("Player ID: \(node.value.id), Name: \(node.value.email)")
                current = node.next
            }
        }
}
