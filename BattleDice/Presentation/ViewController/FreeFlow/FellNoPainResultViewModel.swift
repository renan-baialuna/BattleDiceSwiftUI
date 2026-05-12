//
//  FellNoPainResultViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 30/04/26.
//

import Foundation
import Combine

class FellNoPainResultViewModel: ObservableObject {
    let diceSets: [DiceSet]
    let hits: Int
    let damage: Int
    let wonds: Int
    let limit: Int
    var totalDetahs: Int = 0
    var allDiceCellInfo: [DiceCellInfo] = []
    
    init(diceSets: [DiceSet], hits: Int, damage: Int, wonds: Int, limit: Int) {
        self.diceSets = diceSets
        self.hits = hits
        self.damage = damage
        self.wonds = wonds
        self.limit = limit
        
        self.totalDetahs = calculateDeaths(dicesSets: diceSets, limit: limit, wonds: wonds)
    }
    
    func calculateDeaths(dicesSets: [DiceSet], limit: Int, wonds: Int) -> Int {
        var totalDeath: Int = 0
        var lifeCurrentModel: Int = wonds
        
        for diceSet in dicesSets {
            let sucess = diceSet.diceResult.countBellow(limit: limit)
            let diceCellInfo = DiceCellInfo(diceSet: diceSet, total: diceSet.dices.count, limit: limit)
            self.allDiceCellInfo.append(diceCellInfo)
            if lifeCurrentModel <= sucess {
                totalDeath += 1
                lifeCurrentModel = wonds
            } else {
                lifeCurrentModel -= sucess
            }
        }
        return totalDeath
    }
    
    
    func getHitsTitle() -> String {
        return String(localized: .LocalizableStrings.hitsTitleSimple)
    }
    
    func getDamageTitle() -> String {
        return String(localized: .LocalizableStrings.damageSimple)
    }
    
    func getWondsTitle() -> String {
        return String(localized: .LocalizableStrings.wondsTitleSimple)
    }
    
    func getFnPTitle() -> String {
        return String(localized: .LocalizableStrings.fnPTitleSimple)
    }
    
    func getButtonTitle() -> String {
        return String(localized: .LocalizableStrings.endTitle)
    }
    
    func getDeaths() -> String {
        return String(localized: .LocalizableStrings.deathTotal(String(totalDetahs)))
    }
}

struct DiceCellInfo: Identifiable {
    var id = UUID()
    let diceSet: DiceSet
    let total: Int
    let limit: Int
    let success: Int
    
    init(diceSet: DiceSet, total: Int, limit: Int) {
        self.diceSet = diceSet
        self.total = total
        self.limit = limit
        self.success = diceSet.diceResult.countAbove(limit: limit)
    }
}
