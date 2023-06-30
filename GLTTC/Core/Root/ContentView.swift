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
                Text("GLTTC")
                    .font(.title)
                    .padding(.top, 10)
                
                Group{
                    if viewModel.userSession != nil {
                        LoggedInView()
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
