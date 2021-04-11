//
//  Card.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import Foundation

struct Cards: Hashable, Codable {
    
    var success: String
    var cards: [Card]
    var deck_id: String // ?? Int
    var remaining: String // ?? Int
}

struct Card: Hashable, Codable {
    
}
