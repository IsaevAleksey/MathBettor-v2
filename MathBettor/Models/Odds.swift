//
//  Odds.swift
//  MathBettor
//
//  Created by Алексей Исаев on 12.02.2024.
//

import Foundation

struct OddsData: Decodable {
    let response: [Odds]
}

struct Odds: Decodable {
    let bookmakers: [Bookmaker]
}

struct Bookmaker: Decodable {
    let name: String
    let bets: [Bet]
}

struct Bet: Decodable {
    let name: String
    let values: [Values]
}

struct Values: Decodable {
    let value: String?
    let odd: String
}
