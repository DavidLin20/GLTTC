//
//  ContentView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/27/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            Group{
                if viewModel.userSession != nil {
                    ProfileView()
                } else {
                   LoginView()
                }
            }
            Spacer()
            CustomTabBar()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
