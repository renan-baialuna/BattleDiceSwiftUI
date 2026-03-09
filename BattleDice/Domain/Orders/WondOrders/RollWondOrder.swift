//
//  RollWondOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RollWondOrder: OrderProtocol {
    var priority: Int = 0
    let phase: [PhasesEnum] = [.wond]
    let totalDices: Int
    
    init (totalDices: Int) {
        self.totalDices = totalDices
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        return DiceSet(totalDices: totalDices)
    }
}
