//
//  TournamentView.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/1/23.
//

import SwiftUI

struct TournamentView: View {
    @StateObject private var viewModel = TournamentViewModel()
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
                       viewModel.createTournament(withAccessCode: accessCode, withDate: date)
                   }
                   .padding()
            
                    Button("Fetch") {
                            viewModel.fetchTournaments()
                        }
                        .padding()
                   
                   Text("Tournaments")
                       .font(.title)
                       .padding()
                   
                   List(viewModel.tournaments) { tournament in
                       Text(tournament.accessCode)
                   }
               }
               
           }
    }

struct TournamentView_Previews: PreviewProvider {
    static var previews: some View {
        TournamentView()
    }
}
