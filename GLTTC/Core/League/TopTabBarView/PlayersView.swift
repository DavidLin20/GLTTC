//
//  ParticipantsView.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/30/23.
//

import SwiftUI

struct PlayersView: View {
    @StateObject var playersViewModel = PlayerViewModel()
    
    var body: some View {
        Text("Hello, from Players View!")
        Button("Fetch Users"){
            playersViewModel.displayPlayers();
        }
        
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
