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
    
    func test_straightCheck_lowAce() {
        
        let straightCards = [CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), CardObject(image: "", value: "2", suit: "HEARTS", code: ""), CardObject(image: "", value: "3", suit: "SPADES", code: ""), CardObject(image: "", value: "4", suit: "HEARTS", code: ""), CardObject(image: "", value: "5", suit: "DIAMONDS", code: "")]
        var output = sut.straightCheck(cards: straightCards)
        output.removeLast()
        let expectedOutput: [Double] = [1,2,3,4,5]
        
        XCTAssertEqual(output, expectedOutput)
    }
    func test_evaluateHand_straightFlush() {
        
        let straightFlashCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "3", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: straightFlashCards)
        let expectedOutput = "Super Lucky!! Straight Flush!"
        
        XCTAssertEqual(output, expectedOutput)
    }
    
    func test_evaluateHand_straight() {
        
        let straightCards = [Card(card: CardObject(image: "", value: "ACE", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "2", suit: "SPADES", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "3", suit: "HEARTS", code: ""), uiImage: nil),Card(card: CardObject(image: "", value: "4", suit: "HEARTS", code: ""), uiImage: nil), Card(card: CardObject(image: "", value: "5", suit: "HEARTS", code: ""), uiImage: nil)]
        
        let output = sut.evaluateHand(hand: straightCards)
        let expectedOutput = "Cool! Straight!!"
        
        XCTAssertEqual(output, expectedOutput)
    }
}
