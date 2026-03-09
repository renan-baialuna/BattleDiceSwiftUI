//
//  RollSaveOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RollSaveOrder: OrderProtocol {
    var priority: Int = 0
    let phase: [PhasesEnum] = [.save]
    let totalDices: Int
    
    init (totalDices: Int) {
        self.totalDices = totalDices
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        return DiceSet(totalDices: totalDices)
    }
}
