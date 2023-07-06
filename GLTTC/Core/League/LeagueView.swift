//
//  LeagueView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/29/23.
//

import SwiftUI

struct LeagueView: View {
    @State private var accessCode = ""
    @State private var showAlert = false
    @State private var showAccessCodeAlert = false
    @State private var alertMessage = ""
    @State var selectedTab: TopTabs = .players
    @State var isCheckedIn: Bool = false
    @FocusState private var isFocused: Bool
    @EnvironmentObject var authenticationViewModel: AuthViewModel
    @EnvironmentObject var tournamentViewModel: TournamentViewModel
    
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
//                Button(action: {
//                    showAlert = true
//                }) {
//                    HStack {
//                        Text("Check In")
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                        Image(systemName: "figure.walk.arrival")
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: UIScreen.main.bounds.width - 85, height: 40)
//                    .background(Color.blue)
//                    .cornerRadius(10)
//                    .padding(.top, 24)
//                }
//                .alert("Check in", isPresented: $showAlert, actions: {
//                    TextField("Access Code", text: $accessCode)
//                        .focused($isFocused)
//                        .keyboardType(.numberPad)
//                    Button(action: {}) {
//                        Text("Cancel")
//                            .foregroundColor(.red)
//                    }
//
//                    Button("Confirm", action: {
//                        Task {
//                            await tournamentViewModel.verifyAccessCode(accessCode:accessCode)
//                        }
//
//                        Task {
//                            await authenticationViewModel.checkUserIn(isCheckedIn: isCheckedIn)
//                        }
//                        isCheckedIn.toggle()
//                    })
//                }, message: {
//                    Text("Enter today's access code")
//                })
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
                    Task {
                        let isAccessCodeValid = await tournamentViewModel.verifyAccessCode(accessCode: accessCode)
                        if isAccessCodeValid {
                            isCheckedIn.toggle()
                            await authenticationViewModel.checkUserIn(isCheckedIn: isCheckedIn)
                        } else {
                            // Display an error message or take appropriate action when access code is invalid
                            showAccessCodeAlert = true
                            alertMessage = "Please try again. "
                        }
                    }
                })
                
            }, message: {
                Text("Enter today's access code")
            })
            .alert(isPresented: $showAccessCodeAlert) {
                Alert(
                    title: Text("Invalid Access Code"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
                
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
                            await authenticationViewModel.checkUserIn(isCheckedIn: isCheckedIn)
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
