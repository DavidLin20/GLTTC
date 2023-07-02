//
//  Tournament.swift
//  GLTTC
//
//  Created by Mac-Noble Brako-Kusi on 7/1/23.
//

import Foundation

struct Tournament: Identifiable, Codable {
    let id: String
    let accessCode: String
    let date: String

    

}


extension Tournament {
    static var MOCK_TOURNAMENT = Tournament(id: NSUUID().uuidString, accessCode: "1234", date: "07/01/2023")
}
