//
//  AministratorTournamentViewModel.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/5/23.
//

import SwiftUI

struct AdministratorTournamentView: View {
    @StateObject private var tournamentViewModel = TournamentViewModel()
    @State private var accessCode = ""
    @State private var date = ""
    
    var body: some View {
        VStack {
                   Text("Create Tournament")
                       .font(.title)
                       .padding()
                   
                   TextField("Access Code", text: $accessCode)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   
                   TextField("Date", text: $date)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .padding()
                   
                   Button("Create") {
                       tournamentViewModel.createTournament(withAccessCode: accessCode, withDate: date)
                   }
                   .padding()
            
                    Button("Fetch") {
                            tournamentViewModel.fetchTournaments()
                        }
                        .padding()
                   
                   List(tournamentViewModel.tournaments) { tournament in
                       Text(tournament.accessCode)
                   }
               }
    }
}

struct AministratorTournamentViewModel_Previews: PreviewProvider {
    static var previews: some View {
        AdministratorTournamentView()
    }
}
