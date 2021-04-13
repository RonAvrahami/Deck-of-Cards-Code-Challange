//
//  CodeChallange2Tests.swift
//  CodeChallange2Tests
//
//  Created by Ron Avrahami on 4/12/21.
//

import XCTest
@testable import CodeChallange2

class CodeChallange2Tests: XCTestCase {

    var sut = EvaluationManager()
    
    
    func test_evaluateHand_royalFlush() {
        
        let royalFlushCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "KING", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "QUEEN", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "JACK", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "10", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: royalFlushCards)
        let expectedOutput = "Royal Flush, Amazing!!!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_straightFlush() {
         
         let straightFlushCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "3", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
         
         let output = sut.evaluateHand(hand: straightFlushCards)
         let expectedOutput = "Straight Flush, Super Lucky!!"
         
         XCTAssertEqual(output, expectedOutput)
     }
    
    func test_evaluateHand_fourOfAKind() {
        
        let fourOfAKindCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "ACE", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "ACE", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "ACE", suit: "DIAMONDS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: fourOfAKindCards)
        let expectedOutput = "Four of a Kind, thats Lucky!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_fullHouse() {
        
        let fullHouseCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "ACE", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "ACE", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: fullHouseCards)
        let expectedOutput = "Full House, Wow!!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_flush() {
        
        let flushCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "3", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "7", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: flushCards)
        let expectedOutput = "Flush, Pretty Lucky!"
        
        XCTAssertEqual(output, expectedOutput)
    }

    func test_evaluateHand_straight() {
        
        let straightCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "3", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: straightCards)
        let expectedOutput = "Straight, Pretty Neat!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_threeOfAKind() {
        
        let threeOfAKindCards = [Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: threeOfAKindCards)
        let expectedOutput = "Three of a Kind, Nice!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_twoPair() {
        
        let twoPairCards = [Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "4", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: twoPairCards)
        let expectedOutput = "Two Pair, Pretty good!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_pair() {
        
        let pairCards = [Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "8", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: pairCards)
        let expectedOutput = "Pair, Not bad!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_badHand() {
        
        let badHandCards = [Card(card: CardObject(image: "", value: "7", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "8", suit: "CLUBS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: badHandCards)
        let expectedOutput = "Bad Hand..."
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_straightCheck_highAce() { //ACE as 14
        
        let highAceCards = [CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), CardObject(image: "", value: "KING", suit: "HEARTS", code: ""), CardObject(image: "", value: "QUEEN", suit: "SPADES", code: ""), CardObject(image: "", value: "JACK", suit: "HEARTS", code: ""), CardObject(image: "", value: "10", suit: "DIAMONDS", code: "")]
        var output = sut.straightCheck(cards: highAceCards)
        output.removeLast()
        let expectedOutput: [Double] = [10,11,12,13,14]
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_straightCheck_lowAce() { //ACE as 1
        
        let lowAceCards = [CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), CardObject(image: "", value: "2", suit: "HEARTS", code: ""), CardObject(image: "", value: "3", suit: "SPADES", code: ""), CardObject(image: "", value: "4", suit: "HEARTS", code: ""), CardObject(image: "", value: "5", suit: "DIAMONDS", code: "")]
        var output = sut.straightCheck(cards: lowAceCards)
        output.removeLast()
        let expectedOutput: [Double] = [1,2,3,4,5]
        
        XCTAssertEqual(output, expectedOutput)
    }
}
