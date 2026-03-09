//
//  GetHitInitialResultsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class GetHitInitialResultsOrder: OrderProtocol {

    var phase: [PhasesEnum] = [.hit]
    var priority: Int = 4
    var limit: Int = 6
    var initialResults: Int = 0
    
    init(limit: Int) {
        self.limit = limit
    }
    
    func execute(set: DiceSet?, previewsOrders: [any OrderProtocol]) -> DiceSet {
        if let safeSet = set {
            for index in safeSet.totalResult.indices {
                if index >= (limit - 1) {
                    self.initialResults += safeSet.totalResult[index]
                }
            }
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 10)
        }
    }
}


