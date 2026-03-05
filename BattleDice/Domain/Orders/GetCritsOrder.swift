//
//  GetCritsOrder.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


class GetCritsOrder: OrderProtocol {
    var previewsOrders: [any OrderProtocol] = []
    var phase: [PhasesEnum] = [.hit, .wond]
    var priority: Int = 2
    
    let limit: Int
    var totalCrits: Int = 0
    
    init(limit: Int = 6) {
        self.limit = Calculations.shared.checkLimits(entry: limit)
    }
    
    func execute(set: DiceSet?) -> DiceSet {
        if let safeSet = set {
            for index in safeSet.totalResult.indices {
                if index >= (limit - 1) {
                    self.totalCrits += safeSet.totalResult[index]
                }
            }
            return safeSet
        } else {
            print("error")
            return DiceSet(totalDices: 1)
        }
    }
    
    func getTotalCrits() -> Int {
        return self.totalCrits
    }
}