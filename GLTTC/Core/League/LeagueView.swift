//
//  LeagueView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/29/23.
//

import SwiftUI

struct LeagueView: View {
    @State private var showAlert = false
    @State var selectedTab: TopTabs = .players
    @State var isCheckedIn: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
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
        
        Spacer()
        
        VStack {
                Button(action: {
//                    isCheckedIn.toggle()
                    showAlert = true
                }) {
                    HStack {
                        Text("Check \(isCheckedIn ? "Out" : "In")")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Image(systemName: isCheckedIn ? "figure.walk.departure" : "figure.walk.arrival")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width - 85, height: 40)
                    .background(isCheckedIn ? Color.red : Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Check \(isCheckedIn ? "Out" : "In")"),
                          message:
                            Text("Are you sure you want to \(isCheckedIn ? "check out" : "check in")?"),
                          primaryButton: .default(Text("Confirm"), action: {
                              isCheckedIn.toggle() // Toggle isCheckedIn here
                              Task {
                                  await viewModel.checkUserIn(isCheckedIn: isCheckedIn)
                              }
                          }),
                          secondaryButton: .cancel(Text("Cancel")))
                }
            }

//        Button {
//            isCheckedIn.toggle()
//            Task {
//                await viewModel.checkUserIn(isCheckedIn: isCheckedIn)
//            }
//        } label: {
//            HStack {
//                Text("Check \(isCheckedIn ? "Out" : "In")")
//                    .fontWeight(.semibold)
//                    .foregroundColor(.white)
//                Image(systemName: isCheckedIn ? "figure.walk.departure" : "figure.walk.arrival")
//                    .foregroundColor(.white) // Set the same color as the text
//            }
//            .frame(width: UIScreen.main.bounds.width - 85, height: 40)
//            .background(isCheckedIn ? Color.red : Color.blue)
//            .cornerRadius(10)
//            .padding(.top, 24)
//        }
    }
}

struct LeagueView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueView()
    }
}
