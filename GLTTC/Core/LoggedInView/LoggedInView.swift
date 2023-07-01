//
//  LoggedInView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/30/23.
//

import SwiftUI

struct LoggedInView: View {
    @State var selectedTab: BottomTabs = .league
    
    var body: some View {
        switch selectedTab {
        case .league:
            LeagueView()
        case .account:
            AccountView()
        }
        
        BottomTabBar(selectedTab: $selectedTab)
        
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}
