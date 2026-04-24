//
//  HitResultsViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 22/04/26.
//

import Foundation
import Combine

class HitResultsViewModel: ObservableObject {
    
    let diceSet: DiceSet
    let limit: Int
    
    init(diceSet: DiceSet, limit: Int) {
        self.diceSet = diceSet
        self.limit = limit
    }
    
    func getRerollButton() -> String {
        String(localized: .LocalizableStrings.rerolls)
    }
    
    func getContinueButton() -> String {
        String(localized: .LocalizableStrings.continue)
    }
    
    func getTitle() -> String {
        String(localized: .LocalizableStrings.hitsTitle(String(diceSet.diceResult.countAbove(limit: limit))))
    }
    
    
    
}
