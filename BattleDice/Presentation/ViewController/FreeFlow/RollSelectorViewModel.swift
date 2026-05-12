//
//  RollHitsViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 16/04/26.
//

import Foundation
import Combine

@MainActor
class RollSelectorViewModel: ObservableObject {
    var numberDices: Int = 0
    var diceLimit: Int = 0
    let state: FreeFlowStateEnum
    
    init(state: FreeFlowStateEnum) {
        self.state = state
    }
    
    func getRoute(diceNumber: Int, newLimit: Int) -> AppRoute {
        let diceSet = DiceSet(totalDices: diceNumber)
        return .RollResult(state: self.state, diceSet: diceSet, limit: newLimit)
    }

    
    
//MARK: get strings
    func getHitResume(numberDice: String, diceLimit: String) -> String{
        switch state {
        case .hit:
            return String(localized: .LocalizableStrings.numberHitsResume(numberDice, diceLimit))
        case .wond:
            return String(localized: .LocalizableStrings.numberWondsResume(numberDice, diceLimit))
        case .save:
            return String(localized: .LocalizableStrings.numberSavesResume(numberDice, diceLimit))
        }
    }
    
    func getTitle() -> String {
        switch state {
        case .hit:
            return String(localized: .LocalizableStrings.hitTitle)
        case .wond:
            return String(localized: .LocalizableStrings.wondTitle)
        case .save:
            return String(localized: .LocalizableStrings.saveTitle)
        }
    }
    
    func getDicesString() -> String {
        return String(localized: .LocalizableStrings.dices)
    }
    
    func getHitDices() -> String {
        return  String(localized: .LocalizableStrings.diceNumber)
    }
    
    func getButtonRoll() -> String {
        return String(localized: .LocalizableStrings.roll)
    }
}
