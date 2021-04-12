//
//  JSONManager.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import UIKit

class JSONManager {
    
    let decoder = JSONDecoder()
    var deck: Deck?
    var cards = [Card]()
    
    func getDeck() {
        
        let urlString = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                parseDeck(json: data)
            }
        }
    }
    
    func parseDeck(json: Data) {
        
        do {
            let jsonDeck = try decoder.decode(Deck.self, from: json)
            self.deck = jsonDeck
        }
        catch {
            print(error)
        }
    }
    
    func drawCards() {
        
        getDeck()
        
        let urlString = "https://deckofcardsapi.com/api/deck/\(deck!.deck_id)/draw/?count=5"
        
        if let url = URL(string: urlString) {
            
            if let data = try? Data(contentsOf: url) {
                
                cards.removeAll()
                parseCards(json: data)
                
            }
        }
    }
    
    func parseCards(json: Data) {
        
        do {
            let jsonCards = try decoder.decode(CardObjects.self, from: json)
            
            for jsonCard in jsonCards.cards {
                let card = Card(card: jsonCard, uiImage: getImage(urlString: jsonCard.image))
                self.cards.append(card)
            }
        }
        catch {
            print(error)
        }
    }
    
    func getImage(urlString: String) -> UIImage? {
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    return image
                }
            }
        }
        return nil
    }
    
    func evaluateHand() {
        let urlString = "https://api.pokerapi.dev/v1/winner/texas_holdem?cc=AC,KD,QH,JS,7C&pc[]=10S,8C&pc[]=3S,2C&pc[]=QS,JH"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                parseDeck(json: data)
            }
        }
    }
}

