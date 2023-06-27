//
//  LoginView.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 6/27/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:500, height:120)
                    .padding(.vertical,32)
                Spacer()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
