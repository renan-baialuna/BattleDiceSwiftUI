//
//  RerollOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RerollOrder: OrderProtocol {
    var priority: Int = 1
    let phase: [PhasesEnum] = [.hit, .wond, .save]
    var previewsOrders: [OrderProtocol]
    
    let limit: Int
    
    init (orders: [OrderProtocol], limit: Int) {
        self.previewsOrders = orders
        self.limit = limit
    }
    
    func execute(set: DiceSet?) -> DiceSet {
        if let safeSet = set {
            return DiceSet(initialSet: safeSet, limit: limit)
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
}