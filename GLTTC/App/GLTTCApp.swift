//
//  GLTTCApp.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/27/23.
//
import Firebase
import SwiftUI

@main
struct GLTTCApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
