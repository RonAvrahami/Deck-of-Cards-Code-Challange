//
//  Evaluation.swift
//  CodeChallange2
//
//  Created by Ron Avrahami on 4/11/21.
//

import Foundation

class EvaluationManager {
    
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
        let valuesArray = [aces, kings, queens, jacks, tens, nines, eights, sevens, sixes, fives, fours, threes, twos]
        var values = [CardObject]()
        for value in valuesArray {
            values.append(contentsOf: value)
        }
        
        //MARK: -- Evaluation
        
        for suit in suits {
            
            var suitString: String?
            
            suitCheck(suit: suit, royalty: royalty) { (sequence) in
                
                guard sequence.count != 0 else {
                    return
                }
                guard sequence.first != 777 else {
                    suitString = "Royal Flush, Amazing!!!"
                    return 
                }
                
                var seq = sequence
                let calc = seq.last ?? 0
                seq.removeLast()
                let average = calc/Double(seq.count)
                let rangeCheck = seq.last! - seq.first!
                
                if seq.count > 2 {
                    self.evaluateSuit(suit: suit, seq: seq, rangeCheck: rangeCheck, average: average) { (string) in
                        suitString = string
                    }
                }
            }
            if let string = suitString {
                return string
            }
        }
        
        if let valueString = valuesCheck(valuesArray: valuesArray, values: values) {
            return valueString
        }
        
        return "ERROR"
    }
    
    func suitCheck(suit: [CardObject], royalty: [CardObject], completion: @escaping ([Double]) -> ()) {
        
        if royalty.count == 5 && suit.count == 5 {
            completion([777])
        } else {
            let straight = straightCheck(cards: suit)
            
            completion(straight)
        }
    }
    
    func straightCheck(cards: [CardObject]) -> [Double] {
        
        var seq = [Double]()
        var seqTwo = [Double]()
        var calc: Double = 0
        var aces: Double = 0
        
        for card in cards {
            
            if card.value == "ACE" {
                seq.append(14)
                seqTwo.append(1)
                aces += 1
                
            } else if card.value == "KING" {
                seq.append(13)
                seqTwo.append(13)
                calc += 13
            } else if card.value == "QUEEN" {
                seq.append(12)
                seqTwo.append(12)
                calc += 12
            } else if card.value == "JACK" {
                seq.append(11)
                seqTwo.append(11)
                calc += 11
            } else {
                
                let value = Double(card.value) ?? 0
                seq.append(value)
                seqTwo.append(value)
                calc += value
            }
            
            if cards.last == card {
                
                seq.sort()
                seqTwo.sort()
                
                guard seq.count != 0 && seqTwo.count != 0 else {
                    return []
                }
                
                let rangeCheckOne = seq.last! - seq.first!
                let rangeCheckTwo = seqTwo.last! - seqTwo.first!
                
                if rangeCheckOne > rangeCheckTwo {
                    calc += aces
                    seqTwo.append(calc)
                    
                    return seqTwo
                } else {
                    calc += (14 * aces)
                    seq.append(calc)
                    
                    return seq
                }
            }
        }
        
        return []
    }
    
    func evaluateSuit(suit: [CardObject], seq: [Double], rangeCheck: Double,average: Double, completion: @escaping (String?) -> ()) {
        
        if suit.count == 5 && rangeCheck == 4 {
            completion("Straight Flush, Super Lucky!!")
            
        } else if suit.count == 5 {
            completion("Flush, Pretty Lucky!")
            
        } else {
            completion(nil)
        }
    }
    
    func valuesCheck(valuesArray: [[CardObject]], values: [CardObject]) -> String? {
        
        var threePair = 0
        var twoPair = 0
        
        var seq = straightCheck(cards: values)
        
        guard seq.count != 0 else {
            return nil
        }
        let calc = seq.last ?? 0
        seq.removeLast()
        let average = calc/Double(seq.count)
        let rangeCheck = seq.last! - seq.first!
        
        if seq.count == 5 && rangeCheck == 4 && seq[2] == average {
            return "Straight, Pretty Neat!"
        } else {
            
            for value in valuesArray {
                
                if value.count == 4 {
                    return "Four of a Kind, thats Lucky!"
                    
                } else if value.count == 3 {
                    threePair += 1
                } else if value.count == 2 {
                    twoPair += 1
                }
            }
            
            if threePair != 0 && twoPair != 0 {
                return "Full House, Wow!!"
                
            } else if threePair == 1 {
                return "Three of a Kind, Nice!"
                
            } else if twoPair == 2 {
                return "Two Pair, Pretty good!"
                
            }  else if twoPair == 1 {
                return "Pair, Not bad!"
                
            } else {
                return "Bad Hand..."
            }
        }
    }
}
