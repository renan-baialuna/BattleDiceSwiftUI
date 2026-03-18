//
//  CutLethalsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class CutLethalsOrder: OrderProtocol {
    var phase: PhasesEnum = .hit
    var priority: Int = 3
    
    var totalLethal: Int = 0
    init() {
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        getCrits(previewsOrders: previewsOrders)
        if let safeSet = set {
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
    
    func getCrits(previewsOrders: [any OrderProtocol]) {
        for order in previewsOrders {
            if let order = order as? GetHitCritsOrder {
                self.totalLethal = order.totalCrits
            }
        }
    }
}



