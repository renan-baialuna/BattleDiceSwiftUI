//
//  DiceSetTests.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

import Testing
import XCTest

struct DiceSetTests {
    
    @Test func testCreation() async throws {
        let set = DiceSet(totalDices: 20)
        XCTAssertTrue(set.totalResult.count == 20)
    }
    
    @Test func testReroll() async throws {
        let initialSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3)])
        let reroll = DiceSet(initialSet: initialSet, limit: 1)
        
        XCTAssertTrue(reroll.totalResult[1] >= 1)
        XCTAssertTrue(reroll.totalResult[2] >= 1)
    }
    
    @Test func testTotalD6() async throws {
        let initialSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3)])
        
        XCTAssertTrue(initialSet.calculateTotalD6() == 6)
    }
    
    @Test func testTotalD3() async throws {
        let initialSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3)])
        
        XCTAssertTrue(initialSet.calculateTotalD3() == 4)
    }
}
