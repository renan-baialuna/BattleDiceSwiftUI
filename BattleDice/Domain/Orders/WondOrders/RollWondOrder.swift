//
//  RollWondOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


struct RollWondOrder: OrderProtocol {
    var priority: Int = 0
    let phase: PhasesEnum = .wond
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        return DiceSet(totalDices: getCrits(previewsOrders: previewsOrders))
    }
    
    func getCrits(previewsOrders: [any OrderProtocol]) -> Int {
        for order in previewsOrders {
            if let order = order as? GetHitFinalResultsOrder {
                return order.finalResults
            }
        }
        return 0
    }
}
