//
//  ProfileView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/30/23.
//

import SwiftUI

struct ProfileView: View {
    @State var showRatingView: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            
            VStack {
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
                
                List {
                    Section("Profile") {
                        
                        Button {
                            //
                        } label: {
                            VStack(alignment: .leading) {
                                Text("First Name")
                                    .foregroundColor(.black)
                                Text(user.firstName)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Button {
                            //
                        } label: {
                            VStack(alignment: .leading) {
                                Text("Last Name")
                                    .foregroundColor(.black)
                                Text(user.lastName)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Button {
                            //
                        } label: {
                            VStack(alignment: .leading) {
                                Text("Email")
                                    .foregroundColor(.black)
                                Text(user.email)
                                    .font(.system(size: 20))
                            }
                        }
                        
                        Button {
                            showRatingView.toggle()
                        } label: {
                            Text("Rating")
                                .foregroundColor(.black)
//                            Text(user.rating)
                        }
                        .sheet(isPresented: $showRatingView, content: {
                            RatingView()
                        })
                        
                        
                     
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
