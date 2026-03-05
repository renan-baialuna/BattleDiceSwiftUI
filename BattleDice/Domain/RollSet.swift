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
        var rollOrder = RollOrder(orders: [], totalDices: 10)
        hitOrders.append(rollOrder)
        
        
    }
    
    func runHitOrders() {
        for i in hitOrders {
            self.diceSet = i.execute(set: diceSet)
        }
        
    }
    
    init () {
        setup()
    }
    
}



