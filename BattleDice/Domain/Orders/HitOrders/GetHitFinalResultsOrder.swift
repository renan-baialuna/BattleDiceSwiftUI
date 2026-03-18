//
//  GetHitFinalResultsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class GetHitFinalResultsOrder: OrderProtocol {
    
    var phase: PhasesEnum = .hit
    var priority: Int = 5
    var finalResults: Int = 0
    
    init() {
        
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        calculateResults(previewsOrders: previewsOrders)
        if let safeSet = set {
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
    
    
    func calculateResults(previewsOrders: [any OrderProtocol]) {
        for order in previewsOrders {
            if let order = order as? GetHitInitialResultsOrder {
                finalResults += order.initialResults
            }
            if let order = order as? AddSustainOrder {
                finalResults += order.totalSustain
            }
            if let order = order as? CutLethalsOrder {
                finalResults -= order.totalLethal
            }
        }
    }
}


