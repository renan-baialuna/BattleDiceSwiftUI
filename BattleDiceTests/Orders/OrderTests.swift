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
        let order = RollHitOrder(totalDices: 10)
        set.runOrders()
    }

    @Test func testOrdersReroll() async throws {
        let set = RollSet()
        let rollOrder = RollHitOrder(totalDices: 10)
        let rerollOrder = RerollHitOrder(limit: 4)
        set.orders.append(rollOrder)
        set.orders.append(rerollOrder)
        set.runOrders()
    }
    
    @Test func testOrdersGetCrits() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var GetHitCritsOrder = GetHitCritsOrder()
        set.orders.append(GetHitCritsOrder)
        set.runOrders()
        XCTAssertTrue(GetHitCritsOrder.totalCrits == 1)
        
    }
    
    @Test func testOrdersLethal() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var GetHitCritsOrder = GetHitCritsOrder()
        var cutLethals = CutLethalsOrder()
        set.orders.append(GetHitCritsOrder)
        set.orders.append(cutLethals)
        set.runOrders()
        XCTAssertTrue(cutLethals.totalLethal == 1)
        
    }
    
    @Test func testOrdersSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var GetHitCritsOrder = GetHitCritsOrder()
        var getSustainOrder = AddSustainOrder()
        set.orders.append(GetHitCritsOrder)
        set.orders.append(getSustainOrder)
        set.runOrders()
        XCTAssertTrue(getSustainOrder.totalSustain == 1)
        
    }
    
    @Test func testInitialResultsSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(limit: 5)
        set.orders.append(initialCalculation)
        set.runOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
        
    }
    
    @Test func testFinalResults() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(limit: 5)
        var finalResults = GetHitFinalResultsOrder()
        set.orders.append(initialCalculation)
        set.orders.append(finalResults)
        set.runOrders()
        XCTAssertTrue(finalResults.finalResults == 1)
        
    }
    
    @Test func testFinalResultsSustain() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(limit: 5)
        var critsOrder = GetHitCritsOrder(limit: 5)
        var sustainOrder = AddSustainOrder()
        var finalResults = GetHitFinalResultsOrder()
        set.orders.append(critsOrder)
        set.orders.append(sustainOrder)
        set.orders.append(initialCalculation)
        set.orders.append(finalResults)
        set.runOrders()
        XCTAssertTrue(initialCalculation.initialResults == 2)
    }
    
    @Test func testDevWonds() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetHitInitialResultsOrder(limit: 5)
        var critsOrder = GetHitCritsOrder(limit: 5)
        var devwondsOrder = CutDevWondsOrder()
        var finalResults = GetHitFinalResultsOrder()
        set.orders.append(critsOrder)
        set.orders.append(devwondsOrder)
        set.orders.append(initialCalculation)
        set.orders.append(finalResults)
        set.runOrders()
        XCTAssertTrue(initialCalculation.initialResults == 0)
    }
    
    @Test func testWondsInitialResult() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetWondInitialResultsOrder(limit: 5)
        set.orders.append(initialCalculation)
        set.runOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
    }
    
    @Test func testFinalResultsWond() async throws {
        let set = RollSet()
        set.diceSet = DiceSet(dices: [Dice(value: 1), Dice(value: 2),Dice(value: 3), Dice(value: 6)])
        var initialCalculation = GetWondInitialResultsOrder(limit: 5)
        var finalResults = GetWondsFinalResultsOrder()
        set.orders.append(initialCalculation)
        set.orders.append(finalResults)
        set.runOrders()
        XCTAssertTrue(initialCalculation.initialResults == 1)
    }
    
}
