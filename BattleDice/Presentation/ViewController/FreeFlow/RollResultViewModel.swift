//
//  HitResultsViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 22/04/26.
//

import Foundation
import Combine

class RollResultViewModel: ObservableObject {
    let diceSet: DiceSet
    let limit: Int
    let state: FreeFlowStateEnum
    
    init(state: FreeFlowStateEnum, diceSet: DiceSet, limit: Int) {
        self.state = state
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
        switch state {
        case .hit :
            String(localized: .LocalizableStrings.hitsTitle(String(diceSet.diceResult.countAbove(limit: limit))))
        case .wond:
            String(localized: .LocalizableStrings.wondsTitle(String(diceSet.diceResult.countAbove(limit: limit))))
        case .save:
            String(localized: .LocalizableStrings.savesTitle(String(diceSet.diceResult.countAbove(limit: limit))))
        }
    }
    
    func getContinueRoute() -> AppRoute {
        return .RollSelectionWithValue(state:  self.state.next(now: self.state), value: diceSet.diceResult.countAbove(limit: limit))
    }
    
}
