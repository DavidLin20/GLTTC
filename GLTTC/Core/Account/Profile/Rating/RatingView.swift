//
//  Rating.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 7/2/23.
//

import SwiftUI

struct RatingView: View {
    @State var userRating = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    InputView(text: $userRating, title: "Enter your rating", placeholder: "0", isSecureField: false)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    
                    
                    Button(action: {
                        Task {
                            await viewModel.setUserRating(rating: userRating)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Capsule().fill(Color.blue))
                    }
                }
                .padding()
            }
        Spacer()
        }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
