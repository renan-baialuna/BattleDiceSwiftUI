//
//  DiceTests.swift
//  BattleDiceTests
//
//  Created by Renan Baialuna on 02/03/26.
//

import Testing
import XCTest

struct DiceTests {

    @Test func TestDice() async throws {
        let dice = Dice()
        
        
        print(dice.value)
    }
    
    @Test func TextManyDice() async throws {
        var results1: Int = 0
        var results2: Int = 0
        var results3: Int = 0
        var results4: Int = 0
        var results5: Int = 0
        var results6: Int = 0
        var error: Int = 0
        
        var dices: [Dice] = []
        for i in 1...100 {
            let dice = Dice()
            switch dice.value {
            case 1:
                results1 += 1
            case 2:
                results2 += 1
            case 3:
                results3 += 1
            case 4:
                results4 += 1
            case 5:
                results5 += 1
            case 6:
                results6 += 1
            default:
                error += 1
            }
            dices.append(dice)
        }
        print(results1)
        print(results2)
        print(results3)
        print(results4)
        print(results5)
        print(results6)
        
        XCTAssertTrue(results1 > 0)
        XCTAssertTrue(results2 > 0)
        XCTAssertTrue(results3 > 0)
        XCTAssertTrue(results4 > 0)
        XCTAssertTrue(results5 > 0)
        XCTAssertTrue(results6 > 0)
        XCTAssertTrue(error == 0)
        
    }
    

    

}
