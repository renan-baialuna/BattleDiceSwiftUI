//
//  HitsRerollsSelectorViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import Foundation
import Combine

class HitsRerollsSelectorViewModel: ObservableObject {
    
    let diceSet: DiceSet
    let limit: Int
    
    init(diceSet: DiceSet, limit: Int) {
        self.diceSet = diceSet
        self.limit = limit
    }
    
    func getContinueButton() -> String {
        String(localized: .LocalizableStrings.continue)
    }
    
    func getHitResume(numberDice: String, diceLimit: String) -> String{
        return String(localized: .LocalizableStrings.numberHitsResume(numberDice, diceLimit))
    }
    
    func getTotalRerolls(limit: Int) -> String {
        return String(diceSet.diceResult.countBellow(limit: limit))
    }
    
    func reroll(newLimit: Int) -> DiceSet {
        return DiceSet(initialSet: diceSet, limit: newLimit)
    }
    
    func rerollsSubtitle() -> String {
        return String(localized: .LocalizableStrings.rerollsTitle)
    }
    
    func getRerollsTitle() -> String {
        return String(localized: .LocalizableStrings.rerollHitsTitle)
    }
    
    func getRangeDescription(limit: Int) -> String {
        return  String(localized: .LocalizableStrings.limitFromOne(String(limit)))
    }
    
}
