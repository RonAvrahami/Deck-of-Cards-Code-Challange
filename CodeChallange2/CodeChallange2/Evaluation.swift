//
//  Evaluation.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import Foundation

func evaluateHand(hand: [Card]) -> String {
    
    
    guard hand.count == 5 else {
        return "Invalid Hand"
    }
    
    var cards = [CardObject]()
    
    for card in hand {
        cards.append(card.card)
    }
    
    var royalty = [CardObject]()
    
    var clubs = [CardObject]()
    var diamonds = [CardObject]()
    var spades = [CardObject]()
    var hearts = [CardObject]()
    
    var aces = [CardObject]()
    var kings = [CardObject]()
    var queens = [CardObject]()
    var jacks = [CardObject]()
    var tens = [CardObject]()
    var nines = [CardObject]()
    var eights = [CardObject]()
    var sevens = [CardObject]()
    var sixes = [CardObject]()
    var fives = [CardObject]()
    var fours = [CardObject]()
    var threes = [CardObject]()
    var twos = [CardObject]()
    
    for card in cards {
        
        if card.value == "ACE" {
            royalty.append(card)
            aces.append(card)
        } else if card.value == "KING" {
            royalty.append(card)
            kings.append(card)
        } else if card.value == "QUEEN" {
            royalty.append(card)
            queens.append(card)
        } else if card.value == "JACK" {
            royalty.append(card)
            jacks.append(card)
        } else if card.value == "10" {
            royalty.append(card)
            tens.append(card)
        } else if card.value == "9" {
            nines.append(card)
        } else if card.value == "8" {
            eights.append(card)
        } else if card.value == "7" {
            sevens.append(card)
        } else if card.value == "6" {
            sixes.append(card)
        } else if card.value == "5" {
            fives.append(card)
        } else if card.value == "4" {
            fours.append(card)
        } else if card.value == "3" {
            threes.append(card)
        } else if card.value == "2" {
            twos.append(card)
        }
        
        if card.suit == "CLUBS" {
            clubs.append(card)
        } else if card.suit == "DIAMONDS" {
            diamonds.append(card)
        } else if card.suit == "SPADES" {
            spades.append(card)
        } else if card.suit == "HEARTS" {
            hearts.append(card)
        }
    }
    
    let suits = [clubs, diamonds, spades, hearts]
    let values = [aces, kings, queens, jacks, tens, nines, eights, sevens, sixes, fives, fours, threes, twos]
    
    
    //MARK: -- Evaluation
    
    if royalty.count == 5 {
        if let royalString = royalFlush(royalty: royalty) {
            return royalString
            
        } else {
            
        }
    } else {
        
        var fin = false
        for suit in suits {
            
            var suitString: String?

            suitCheck(suit: suit) { (sequence) in
                
                var seq = sequence
                let calc = seq.last ?? 0
                seq.removeLast()
                let average = calc/5
                
                if seq.count > 2 {
                    eval(suit: suit, seq: seq, average: average) { (string) in
                        if string != nil {
                        fin = true
                        }
                        suitString = string
                    }
                }
            }
            if let string = suitString {
                
                return string
            }
        }
        if fin == false {
            if let valueString = valuesCheck(values: values) {
                
                return valueString
            } else {
                
            }
        }
    }
    return "ERROR"
}

func royalFlush(royalty: [CardObject]) -> String? {
    
    var suit = ""
    var count = 0
    
    for royal in royalty {
        
        if suit == "" {
            suit = royal.suit
            count += 1
        } else {
            if royal.suit == suit {
                count += 1
            }
        }
    }
    if count == 5 {
        return "Holy Cow! Royal Flush!!"
        
    }
    return nil
}

func suitCheck(suit: [CardObject], completion: @escaping ([Int]) -> ()) {
    
    var seq = [Int]()
    var calc = 0
    
    for card in suit {
        
        if card.value == "ACE" {
            seq.append(14)
            calc += 14
        } else if card.value == "KING" {
            seq.append(13)
            calc += 13
        } else if card.value == "QUEEN" {
            seq.append(12)
            calc += 12
        } else if card.value == "JACK" {
            seq.append(11)
            calc += 11
        } else {
            let value = Int(card.value) ?? 0
            seq.append(value)
            calc += value
        }
        
        if suit.last == card {
            seq.sort()
            seq.append(calc)
            
            completion(seq)
            
        } else {
            
        }
    }
}

func eval(suit: [CardObject], seq: [Int], average: Int, completion: @escaping (String?) -> ()) {
    
    if suit.count == 5 && seq[2] == average {
        completion("Super Lucky!! Straight Flush!")

    } else if suit.count == 5 {
        completion("Lucky! Flush!")

    } else if seq[2] == average {
        completion("Lucky! Straight!")
        
    } else {
        completion(nil)
    }
}

func valuesCheck(values: [[CardObject]]) -> String? {
    
    var threePair = 0
    var twoPair = 0
    var onePair = 0
    for value in values {
        
        if value.count == 4 {
            print("No Way! Four of a Kind!!")
            
        } else if value.count == 3 {
            threePair += 1
        } else if value.count == 2 {
            twoPair += 1
        } else {
            onePair += 1
        }
    }
    if threePair != 0 && twoPair != 0 {
        return "Wow! Full House!!"
        
    } else if threePair == 1 {
        return "Nice! Three of a Kind!!"
        
    } else if twoPair == 2 {
        return "Pretty good! Two Pair!!"
        
    }  else if twoPair == 1 {
        return "Not bad! Pair!!"
        
    } else {
        return "Bad Hand..."
    }
}
