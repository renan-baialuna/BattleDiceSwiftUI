//
//  RollSet.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

import Foundation

class RollSet {
    var diceSet: DiceSet?
    var hitOrders: [OrderProtocol] = []
    var wondOrders: [OrderProtocol] = []
    var saveOrders: [OrderProtocol] = []
    
    func setup() {
        var rollOrder = RollOrder(set: self, orders: [], totalDices: 10)
        hitOrders.append(rollOrder)
        
        
    }
    
    func runHitOrders() {
        for i in hitOrders {
            i.execute(set: self)
        }
        
    }
    
    init () {
        setup()
    }
    
}

struct RollOrder: OrderProtocol {
    var set: RollSet
    var previewsOrders: [OrderProtocol]
    
    let totalDices: Int
    
    init (set: RollSet, orders: [OrderProtocol], totalDices: Int) {
        self.set = set
        self.previewsOrders = orders
        self.totalDices = totalDices
    }
    
    func execute(set: RollSet) {
        set.diceSet = DiceSet(totalDices: totalDices)
    }
    
}
