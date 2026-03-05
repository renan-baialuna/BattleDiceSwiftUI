//
//  OrderTests.swift
//  BattleDiceTests
//
//  Created by Renan Baialuna on 02/03/26.
//

import Testing
import XCTest

struct OrderTests {

    @Test func testOrders() async throws {
        let set = RollSet()
        let order = RollOrder(orders: [], totalDices: 10)
        set.runHitOrders()
    }

    @Test func testOrdersReroll() async throws {
        let set = RollSet()
        let rollOrder = RollOrder(orders: [], totalDices: 10)
        let rerollOrder = RerollOrder(orders: [], limit: 4)
        set.hitOrders.append(rollOrder)
        set.hitOrders.append(rerollOrder)
        set.runHitOrders()
    }
    
    @Test func testOrdersGetCrits() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var getCritsOrder = GetCritsOrder(previewsOrders: [])
        set.hitOrders.append(getCritsOrder)
        set.runHitOrders()
        XCTAssertTrue(getCritsOrder.totalCrits == 1)
        
    }
    
    @Test func testOrdersLethal() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var getCritsOrder = GetCritsOrder(previewsOrders: [])
        var cutLethals = CutLethalsOrder(previewsOrders: [getCritsOrder])
        set.hitOrders.append(getCritsOrder)
        set.hitOrders.append(cutLethals)
        set.runHitOrders()
        XCTAssertTrue(cutLethals.totalLethal == 1)
        
    }
    
    @Test func testOrdersSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var getCritsOrder = GetCritsOrder(previewsOrders: [])
        var getSustainOrder = AddSustainOrder(previewsOrders: [getCritsOrder])
        set.hitOrders.append(getCritsOrder)
        set.hitOrders.append(getSustainOrder)
        set.runHitOrders()
        XCTAssertTrue(getSustainOrder.totalSustain == 1)
        
    }
    
    @Test func testInitialResultsSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(previewsOrders: [],limit: 5)
        set.hitOrders.append(initialCalculation)
        set.runHitOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
        
    }
    
    @Test func testFinalResults() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(previewsOrders: [],limit: 5)
        var finalResults = GetHitFinalResultsOrder(previewsOrders: [initialCalculation])
        set.hitOrders.append(initialCalculation)
        set.hitOrders.append(finalResults)
        set.runHitOrders()
        XCTAssertTrue(finalResults.finalResults == 1)
        
    }
    
    @Test func testFinalResultsSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(previewsOrders: [],limit: 5)
        var critsOrder = GetCritsOrder(previewsOrders: [], limit: 5)
        var sustainOrder = AddSustainOrder(previewsOrders: [critsOrder])
        var finalResults = GetHitFinalResultsOrder(previewsOrders: [initialCalculation])
        set.hitOrders.append(critsOrder)
        set.hitOrders.append(sustainOrder)
        set.hitOrders.append(initialCalculation)
        set.hitOrders.append(finalResults)
        set.runHitOrders()
        XCTAssertTrue(initialCalculation.initialResults == 2)
    }
    
    @Test func testDevWonds() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(previewsOrders: [],limit: 5)
        var critsOrder = GetCritsOrder(previewsOrders: [], limit: 5)
        var devwondsOrder = CutDevWondsOrder(previewsOrders: [critsOrder])
        var finalResults = GetHitFinalResultsOrder(previewsOrders: [initialCalculation])
        set.hitOrders.append(critsOrder)
        set.hitOrders.append(devwondsOrder)
        set.hitOrders.append(initialCalculation)
        set.hitOrders.append(finalResults)
        set.runHitOrders()
        XCTAssertTrue(initialCalculation.initialResults == 0)
    }
    
    @Test func testWondsInitialResult() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetWondInitialResultsOrder(previewsOrders: [],limit: 5)
        set.hitOrders.append(initialCalculation)
        set.runHitOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
    }
    
    @Test func testFinalResultsWond() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetWondInitialResultsOrder(previewsOrders: [],limit: 5)
        var finalResults = GetWondsFinalResultsOrder(previewsOrders: [initialCalculation])
        set.hitOrders.append(initialCalculation)
        set.hitOrders.append(finalResults)
        set.runHitOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
    }
    
}
