//
//  ProfileView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/27/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            List {
                Section {
                    HStack {
                        Text("MJ")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Michael Jordan")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text("test@gmail.com")
                                .font(.footnote)
                                .accentColor(.gray)
                            
                        }
                    }
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
                        print("Sign out...")
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    
                }
                
            }
            
            Spacer()
            
            Button{
                print("Log user in...")
            } label: {
                HStack{
                    Text("Delete Account")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.red))
            .cornerRadius(10)
            .padding(.top, 24)
        }
        .background(Color(.systemGray6))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
