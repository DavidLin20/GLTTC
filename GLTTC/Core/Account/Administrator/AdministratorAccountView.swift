//
//  TournamentView.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/1/23.
//

import SwiftUI

struct AdministratorAccountView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            if let user = viewModel.currentUser {
                VStack {
                    List {
                        Section {
                            HStack {
                                Text(user.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 72, height: 72)
                                    .background(Color(.systemGray3))
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(user.firstName + " " + user.lastName)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .padding(.top, 4)
                                    
                                    Text(user.email)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                        }
                        
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SettingsRowView(imageName: "person.text.rectangle.fill", title: "Profile", tintColor: .blue)
                        }
                        
                        Section("General") {
                            HStack {
                                SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                                
                                Spacer()
                                
                                Text("1.0.0")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Section("Account") {
                            Button {
                                viewModel.signOut()
                            } label: {
                                SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                            }
                            
                        }
                        
                        Section {
                            Button {
                                viewModel.deleteAccount()
                            } label: {
                                SettingsRowView(imageName: "person.crop.circle.fill.badge.xmark", title: "Delete account", tintColor: .red)
                            }
                        }
                        NavigationLink {
                            AdministratorTournamentView()
                        } label: {
                            SettingsRowView(imageName: "person.2.badge.gearshape.fill", title: "Manage Tournament", tintColor: .blue)
                        }
                    }
                }
            }
        }
               
           }
    }

struct AdministratorView_Previews: PreviewProvider {
    static var previews: some View {
        AdministratorAccountView()
    }
}
