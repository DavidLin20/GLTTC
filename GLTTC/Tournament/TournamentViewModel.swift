//
//  TournamentViewModel.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/1/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
class TournamentViewModel: ObservableObject {
    @Published var tournaments: [Tournament] = []
    
    func createTournament(withAccessCode accessCode: String, withDate date: String) {
        let tournament = Tournament(id: UUID().uuidString, accessCode: accessCode, date: date)
        
        do {
            let encodedTournament = try Firestore.Encoder().encode(tournament)
            Firestore.firestore().collection("tournaments").document(tournament.id).setData(encodedTournament)
        } catch {
            print("Failed to create tournament with error: \(error.localizedDescription)")
        }
    }
    
    func fetchTournaments() {
        Firestore.firestore().collection("tournaments").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Failed to fetch tournaments with error: \(error?.localizedDescription ?? "")")
                return
            }
            
            do {
                let tournaments = try documents.compactMap { try $0.data(as: Tournament.self) }
                
                self.tournaments = tournaments
                
                for tournament in tournaments {
                    print("Tournament: \(tournament.id) - Access Code: \(tournament.accessCode) - Date: \(tournament.date)")
                }
            } catch {
                print("Failed to decode tournaments with error: \(error.localizedDescription)")
            }
        }
    }
}
