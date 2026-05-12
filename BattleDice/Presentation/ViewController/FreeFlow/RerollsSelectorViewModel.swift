//
//  HitsRerollsSelectorViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import Foundation
import Combine

class RerollsSelectorViewModel: ObservableObject {
    
    let diceSet: DiceSet
    let limit: Int
    let state: FreeFlowStateEnum
    
    init(state: FreeFlowStateEnum, diceSet: DiceSet, limit: Int) {
        self.state = state
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
        switch state {
        case .hit:
            return String(localized: .LocalizableStrings.rerollHitsTitle)
        case .wond: 
            return String(localized: .LocalizableStrings.rerollWondsTitle)
        case .save:
            return String(localized: .LocalizableStrings.rerollSaveTitle)
        }
    }
    
    func getNextRoute() -> AppRoute {
        return .RollSelectionWithValue(state:  self.state.next(now: self.state), value: diceSet.diceResult.countAbove(limit: limit))
    }
    
    func getRangeDescription(limit: Int) -> String {
        return  String(localized: .LocalizableStrings.limitFromOne(String(limit)))
    }
    
}
