//
//  RollSetTests.swift
//  BattleDiceTests
//
//  Created by Renan Baialuna on 09/03/26.
//

import Testing
import XCTest

struct RollSetTests {
    
    

    @Test func hitOrdersTest() async throws {
        var set = RollSet()
        set.setInitialHitOrders(dices: 10, limit: 3)
        
        XCTAssertTrue(set.hitOrders.count == 3)
        
        set.runHitOrders()
        
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        
        
    }

}
