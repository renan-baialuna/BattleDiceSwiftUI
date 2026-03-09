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
        
        
    }
    
    func runHitOrders() {
        for i in hitOrders {
            self.diceSet = i.execute(set: diceSet, previewsOrders: self.hitOrders)
            diceSet?.printResults()
        }
        
    }
    
    init () {
        setup()
    }
    
    func setInitialOrders() {
        
    }
    
    func setInitialHitOrders(dices: Int, limit: Int) {
        var orderArray: [OrderProtocol] = []
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollHitOrder(totalDices: dices)
        let preliminar = GetHitInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetHitFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
        
        self.hitOrders = orderArray
    }
    
    func setInitialWondOrders(dices: Int, limit: Int) {
        var orderArray = self.wondOrders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollWondOrder(totalDices: dices)
        let preliminar = GetWondInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetWondsFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
    }
    
    func setInitialSaveOrders(dices: Int, limit: Int) {
        var orderArray = self.saveOrders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollSaveOrder(totalDices: dices)
        let preliminar = GetSaveInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetSaveFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
    }
    
    
    
    func getResults() -> Int? {
        for i in hitOrders.reversed() {
            if let order = i as? GetHitFinalResultsOrder {
                return  order.finalResults
            }
        }
        return nil
    }
    
    
    
    
}

public class MechanicSingleton {
    static let shared = MechanicSingleton()
    private init() {
    }
    
    func rerrollHits(orderArray: [OrderProtocol], limit: Int) -> [OrderProtocol] {
        return [RerollHitOrder(limit: limit)]
    }
    
}


struct Keyword {
    let name: String
    let description: String
    let phase: [PhasesEnum]
    let orders: [OrderProtocol]
}

