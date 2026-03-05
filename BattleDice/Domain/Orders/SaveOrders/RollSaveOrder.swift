//
//  RollSaveOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RollSaveOrder: OrderProtocol {
    var priority: Int = 0
    let phase: [PhasesEnum] = [.save]
    var previewsOrders: [OrderProtocol]
    
    let totalDices: Int
    
    init (orders: [OrderProtocol], totalDices: Int) {
        self.previewsOrders = orders
        self.totalDices = totalDices
    }
    
    func execute(set: DiceSet?) -> DiceSet {
        return DiceSet(totalDices: totalDices)
    }
}
