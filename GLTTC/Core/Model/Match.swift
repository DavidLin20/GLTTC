//
//  Match.swift
//  GLTTC
//
//  Created by Ti Wei Lin on 7/11/23.
//

import Foundation

struct Match: Identifiable, Codable {
    let id: String
    let tournamentId: String
    let playerOneId: String
    let playerTwoId: String
    let winnerId: String?
    let startTime: Date
    let endTime: Date?
    let playerOneScore: [Int]
    let playerTwoScore: [Int]
    let section: String
    let tableNumber: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case tournamentId
        case playerOneId
        case playerTwoId
        case winnerId
        case startTime
        case endTime
        case playerOneScore
        case playerTwoScore
        case section
        case tableNumber
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        tournamentId = try container.decode(String.self, forKey: .tournamentId)
        playerOneId = try container.decode(String.self, forKey: .playerOneId)
        playerTwoId = try container.decode(String.self, forKey: .playerTwoId)
        winnerId = try container.decodeIfPresent(String.self, forKey: .winnerId)
        startTime = try container.decode(Date.self, forKey: .startTime)
        endTime = try container.decodeIfPresent(Date.self, forKey: .endTime)
        playerOneScore = try container.decode([Int].self, forKey: .playerOneScore)
        playerTwoScore = try container.decode([Int].self, forKey: .playerTwoScore)
        section = try container.decode(String.self, forKey: .section)
        tableNumber = try container.decodeIfPresent(Int.self, forKey: .tableNumber)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(tournamentId, forKey: .tournamentId)
        try container.encode(playerOneId, forKey: .playerOneId)
        try container.encode(playerTwoId, forKey: .playerTwoId)
        try container.encode(winnerId, forKey: .winnerId)
        try container.encode(startTime, forKey: .startTime)
        try container.encode(endTime, forKey: .endTime)
        try container.encode(playerOneScore, forKey: .playerOneScore)
        try container.encode(playerTwoScore, forKey: .playerTwoScore)
        try container.encode(section, forKey: .section)
        try container.encode(tableNumber, forKey: .tableNumber)
    }
}


