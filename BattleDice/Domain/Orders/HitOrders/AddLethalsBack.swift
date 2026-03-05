//
//  AddLethalsBack.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class AddLethalsBack: OrderProtocol {
    var previewsOrders: [any OrderProtocol] = []
    var phase: [PhasesEnum] = [.wond]
    var priority: Int = 4
    
    var totalToAdd: Int = 0
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
            if let order = order as? CutLethalsOrder {
                self.totalToAdd = order.totalLethal
            }
        }
    }
}