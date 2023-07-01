//
//  ProfileView.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/30/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            List {
                Section("Profile") {
                    Button {
                        //
                    } label: {
                        SettingsRowView(imageName: "person.text.rectangle.fill", title: "Profile", tintColor: .blue)
                    }
                    Button {
                        //
                    } label: {
                        SettingsRowView(imageName: "person.text.rectangle.fill", title: "Profile", tintColor: .blue)
                    }
                    Button {
                        //
                    } label: {
                        SettingsRowView(imageName: "person.text.rectangle.fill", title: "Profile", tintColor: .blue)
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
