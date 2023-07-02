//
//  LeagueView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/29/23.
//

import SwiftUI

//private enum Field: Int, CaseIterable {
//    case accescode
//}


struct LeagueView: View {
    @State private var accessCode = ""
    @State private var showAlert = false
    @State var selectedTab: TopTabs = .players
    @State var isCheckedIn: Bool = false
    @FocusState private var isFocused: Bool
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
            // Check in Button
            if (!isCheckedIn) {
                Button(action: {
                    showAlert = true
                }) {
                    HStack {
                        Text("Check In")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Image(systemName: "figure.walk.arrival")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width - 85, height: 40)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
                .alert("Check in", isPresented: $showAlert, actions: {
                    TextField("Access Code", text: $accessCode)
                        .focused($isFocused)
                        .keyboardType(.numberPad)
                    Button(action: {}) {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                    
                    Button("Confirm", action: {
                        isCheckedIn.toggle()
                        Task {
                            await viewModel.checkUserIn(isCheckedIn: isCheckedIn)
                        }
                    })
                }, message: {
                    Text("Enter today's access code")
                })
                
            } else {
                // Check out button
                Button(action: {
                    showAlert = true
                }) {
                    HStack {
                        Text("Check Out")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Image(systemName: "figure.walk.departure")
                            .foregroundColor(.white)
                    }
                    .frame(width: UIScreen.main.bounds.width - 85, height: 40)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Check Out"),
                          message:
                            Text("Are you sure you want to check out?"),
                          primaryButton: .default(Text("Confirm"), action: {
                        isCheckedIn.toggle() // Toggle isCheckedIn here
                        Task {
                            await viewModel.checkUserIn(isCheckedIn: isCheckedIn)
                        }
                    }),
                          secondaryButton: .cancel(Text("Cancel")))
                }
            }
        }

        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isFocused = false
                }
                .disabled(!isFocused)
            }
        }
    }
    
}

struct LeagueView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueView()
    }
}
