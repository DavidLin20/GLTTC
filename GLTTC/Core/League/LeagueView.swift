//
//  LeagueView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/29/23.
//

import SwiftUI

struct LeagueView: View {
    @State var selectedTab: TopTabs = .players
    var body: some View {
            TopTabBar(selectedTab: $selectedTab)
            //Spacer()
        
        switch selectedTab {
        case .ponging:
            PongingView()
            
        case .onDeck:
            OnDeckView()
            
        case .waiting:
            WaitingView()
            
        case .players:
            PlayersView()
        }
    }
}

struct LeagueView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueView()
    }
}
