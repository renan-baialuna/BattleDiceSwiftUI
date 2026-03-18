//
//  AddDevwondsBack.swift
//  BattleDice
//
//  Created by Renan Baialuna on 13/03/26.
//


class AddDevwondsBack: OrderProtocol {
    var phase: PhasesEnum = .save
    var priority: Int = 4
    
    var totalToAdd: Int = 0
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
            if let order = order as? CutDevWondsOrder {
                self.totalToAdd = order.totalDev
            }
        }
    }
}
