//
//  OrderTests.swift
//  BattleDiceTests
//
//  Created by Renan Baialuna on 02/03/26.
//

import Testing

struct OrderTests {

    @Test func testOrders() async throws {
        let set = RollSet()
        let order = RollOrder(set: set, orders: [], totalDices: 10)
        set.runHitOrders()
    }

}
