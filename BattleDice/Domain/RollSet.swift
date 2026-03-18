//
//  RollSet.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

import Foundation

class RollSet {
    var diceSet: DiceSet?
    var orders: [OrderProtocol] = []
    
    func setup() {
        
        
    }
    
    func runOrders() {
        for i in orders {
            self.diceSet = i.execute(set: diceSet, previewsOrders: self.orders)
            diceSet?.printResults()
        }
        
    }
    
    init () {
        setup()
    }
    
    func setInitialHitOrders(dices: Int, limit: Int) {
        let initial = MechanicSingleton.shared.setInitialHitOrders(total: dices, limit: limit)
        let wond = MechanicSingleton.shared.setInitialWondOrders(limit: dices)
        
        let intitialOrders = MechanicSingleton.shared.OrganizeOrders(orders: [initial, wond])
        print(intitialOrders)
        
    }
    
    func setInitialWondOrders(dices: Int, limit: Int) {
        var orderArray = self.orders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollWondOrder()
        let preliminar = GetWondInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetWondsFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
    }
    
    func setInitialSaveOrders(dices: Int, limit: Int) {
        var orderArray = self.orders
        var safeLimit = Calculations.shared.checkLimits(entry: limit)
        
        let rollOrder = RollSaveOrder()
        let preliminar = GetSaveInitialResultsOrder(limit: safeLimit)
        let finalHitOrder = GetSaveFinalResultsOrder()
        
        orderArray.append(rollOrder)
        orderArray.append(preliminar)
        orderArray.append(finalHitOrder)
    }
    
    
    
    func getResults() -> Int? {
        for i in orders.reversed() {
            if let order = i as? GetHitFinalResultsOrder {
                return  order.finalResults
            }
        }
        return nil
    }
    
    
    
    
}




protocol MechanicConector {
    var keyWord: Keyword? { get }
    func generateOrders() -> [OrderProtocol]
}




