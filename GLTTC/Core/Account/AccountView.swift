//
//  AccountView.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/5/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser
        {
            if (user.isAdmin) {
                AdministratorAccountView()
            }
                
            else
            {
                UserAccountView()
            }
              
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
