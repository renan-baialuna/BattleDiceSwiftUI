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
            self.diceSet = i.execute(set: diceSet)
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
        
        let rollOrder = RollHitOrder(orders: orderArray, totalDices: dices)
        let preliminar = GetHitInitialResultsOrder(previewsOrders: orderArray, limit: safeLimit)
        let finalHitOrder = GetHitFinalResultsOrder(previewsOrders: orderArray)
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
        
        self.hitOrders = orderArray
    }
    
    func setInitialWondOrders(dices: Int, limit: Int) {
        var orderArray = self.wondOrders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollWondOrder(orders: orderArray, totalDices: dices)
        let preliminar = GetWondInitialResultsOrder(previewsOrders: orderArray, limit: safeLimit)
        let finalHitOrder = GetWondsFinalResultsOrder(previewsOrders: orderArray)
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
    }
    
    func setInitialSaveOrders(dices: Int, limit: Int) {
        var orderArray = self.saveOrders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollSaveOrder(orders: orderArray, totalDices: dices)
        let preliminar = GetSaveInitialResultsOrder(previewsOrders: orderArray, limit: safeLimit)
        let finalHitOrder = GetSaveFinalResultsOrder(previewsOrders: orderArray)
        
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
        return [RerollHitOrder(orders: orderArray, limit: limit)]
    }
    
}


struct Keyword {
    let name: String
    let description: String
    let phase: [PhasesEnum]
    let orders: [OrderProtocol]
}

