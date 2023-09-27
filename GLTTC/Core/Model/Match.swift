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
    let playerOne: User
    let playerTwo: User
    let scoreBoard: ScoreBoard
    let matchWinner: User?
    let startTime: Date
    let endTime: Date?
    let section: String
    let tableNumber: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case tournamentId
        case playerOne
        case playerTwo
        case scoreBoard
        case matchWinner
        case startTime
        case endTime
        case section
        case tableNumber
    }
    
    init(id: String, tournamentId: String, playerOne: User, playerTwo: User, scoreBoard: ScoreBoard, matchWinner: User?, startTime: Date, endTime: Date?, section: String, tableNumber: Int?) {
            self.id = id
            self.tournamentId = tournamentId
            self.playerOne = playerOne
            self.playerTwo = playerTwo
            self.scoreBoard = scoreBoard
            self.matchWinner = matchWinner
            self.startTime = startTime
            self.endTime = endTime
            self.section = section
            self.tableNumber = tableNumber
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        tournamentId = try container.decode(String.self, forKey: .tournamentId)
        playerOne = try container.decode(User.self, forKey: .playerOne)
        playerTwo = try container.decode(User.self, forKey: .playerTwo)
        scoreBoard = try container.decode(ScoreBoard.self, forKey: .scoreBoard)
        matchWinner = try container.decodeIfPresent(User.self, forKey: .matchWinner)
        startTime = try container.decode(Date.self, forKey: .startTime)
        endTime = try container.decodeIfPresent(Date.self, forKey: .endTime)
        section = try container.decode(String.self, forKey: .section)
        tableNumber = try container.decodeIfPresent(Int.self, forKey: .tableNumber)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(tournamentId, forKey: .tournamentId)
        try container.encode(playerOne, forKey: .playerOne)
        try container.encode(playerTwo, forKey: .playerTwo)
        try container.encode(scoreBoard, forKey: .scoreBoard)
        try container.encode(matchWinner, forKey: .matchWinner)
        try container.encode(startTime, forKey: .startTime)
        try container.encode(endTime, forKey: .endTime)
        try container.encode(section, forKey: .section)
        try container.encode(tableNumber, forKey: .tableNumber)
    }
}
