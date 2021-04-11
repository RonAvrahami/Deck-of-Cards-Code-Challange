//
//  Card.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import UIKit

struct Deck: Hashable, Codable {
    
    var success: Bool
    var deck_id: String
    var shuffled: Bool
    var remaining: Int
    
    var cards: CardObjects?
}

struct CardObjects: Hashable, Codable {
    
    var success: Bool
    var cards: [CardObject]
    var deck_id: String
    var remaining: Int
}

struct CardObject: Hashable, Codable {
    
    var image: String
    var value: String
    var suit: String
    var code: String
}

struct Card: Hashable {
    
    var card: CardObject
    var uiImage: UIImage?
}

