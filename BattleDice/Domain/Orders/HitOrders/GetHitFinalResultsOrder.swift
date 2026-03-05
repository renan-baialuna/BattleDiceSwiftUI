//
//  GetHitFinalResultsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class GetHitFinalResultsOrder: OrderProtocol {
    var previewsOrders: [any OrderProtocol]
    var phase: [PhasesEnum] = [.hit]
    var priority: Int = 4
    var finalResults: Int = 0
    
    init(previewsOrders: [any OrderProtocol]) {
        self.previewsOrders = previewsOrders
    }
    
    func execute(set: DiceSet?) -> DiceSet {
        calculateResults()
        if let safeSet = set {
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
    
    func calculateResults() {
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


