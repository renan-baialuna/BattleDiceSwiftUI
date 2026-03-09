//
//  RerollOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RerollHitOrder: OrderProtocol {

    var priority: Int = 1
    let phase: [PhasesEnum] = [.hit]
    
    let limit: Int
    
    init (limit: Int) {
        self.limit = limit
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        if let safeSet = set {
            return DiceSet(initialSet: safeSet, limit: limit)
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
}
