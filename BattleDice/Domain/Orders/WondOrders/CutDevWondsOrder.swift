//
//  CutDevWondsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class CutDevWondsOrder: OrderProtocol {
    var previewsOrders: [any OrderProtocol] = []
    var phase: [PhasesEnum] = [.wond]
    var priority: Int = 3
    
    var totalDev: Int = 0
    init(previewsOrders: [any OrderProtocol]) {
        self.previewsOrders = previewsOrders
    }
    func execute(set: DiceSet?) -> DiceSet {
        getCrits()
        if let safeSet = set {
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
    
    func getCrits() {
        for order in previewsOrders {
            if let order = order as? GetCritsOrder {
                self.totalDev = order.totalCrits
            }
        }
    }
}


