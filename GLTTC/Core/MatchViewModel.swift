//
//  MatchViewModel.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 7/11/23.
//

import Foundation
import Firebase

class MatchViewModel: ObservableObject {
    @Published var matches: [Match] = []
    
    private var db = Firestore.firestore()
    
    // Create a match in Firebase
    func createMatch(match: Match) {
        do {
            let _ = try db.collection("matches").addDocument(from: match)
        } catch {
            print("Error creating match: \(error.localizedDescription)")
        }
    }
    
    // Fetch all matches from Firebase
    func fetchMatches() {
        db.collection("matches").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching matches: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.matches = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: Match.self)
            }
        }
    }
    
    func fetchMatchById(tournamentId: String, playerOneId: String, playerTwoId: String) async throws -> Match? {
        let querySnapshot = try await Firestore.firestore()
            .collection("matches")
            .whereField("tournamentId", isEqualTo: tournamentId)
            .whereField("playerOneId", isEqualTo: playerOneId)
            .whereField("playerTwoId", isEqualTo: playerTwoId)
            .getDocuments()
        
        guard let document = querySnapshot.documents.first else {
            print("No match found for the provided IDs")
            return nil
        }
        
        do {
            let match = try document.data(as: Match.self)
            return match
        } catch {
            print("Failed to decode match with error: \(error.localizedDescription)")
            return nil
        }
    }

    
    func decideWinner() async {
        do {
            guard let match = try await fetchMatchById(tournamentId: "123", playerOneId: "1", playerTwoId: "2") else {
                print("Match not found")
                return
            }
            
            var playerOneWinCount = 0
            var playerTwoWinCount = 0
            
            for game in 1...5 {
                if match.scoreBoard.scoreArrayOne[game] > match.scoreBoard.scoreArrayTwo[game] {
                    playerOneWinCount += 1
                } else if match.scoreBoard.scoreArrayOne[game] < match.scoreBoard.scoreArrayTwo[game] {
                    playerTwoWinCount += 1
                }
            }
            
            if playerOneWinCount > playerTwoWinCount {
                setWinner(id: "1")
            } else {
                setWinner(id: "2")
            }
            
            // Update the match document in Firebase with the winner information
            try await Firestore.firestore().collection("matches").document(match.id).setData(from: match)
            
        } catch {
            print("Error deciding and setting winner: \(error.localizedDescription)")
        }
    }
    
    func setWinner(id: String) {
        let db = Firestore.firestore()
        let matchRef = db.collection("matches").document(id)
        
        matchRef.updateData(["winnerId": id]) { error in
            if let error = error {
                print("Error updating winner: \(error.localizedDescription)")
            } else {
                print("Winner updated successfully.")
            }
        }
    }

}

