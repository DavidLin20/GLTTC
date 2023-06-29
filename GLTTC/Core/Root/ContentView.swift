//
//  ContentView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: Tabs = .league
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            Group{
                if viewModel.userSession != nil {
                    ProfileView()
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                } else {
                   LoginView()
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
