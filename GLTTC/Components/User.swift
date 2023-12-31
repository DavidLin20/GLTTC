//
//  User.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 6/27/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    
    var initials: String {
        let fullName = firstName + " " + lastName
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, firstName: "Michael", lastName: "Jordan", email: "test@gmail.com")
}
