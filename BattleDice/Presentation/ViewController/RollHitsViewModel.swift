//
//  RollHitsViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 16/04/26.
//

import Foundation
import Combine

@MainActor
class RollHitsViewModel: ObservableObject {
    var numberDices: Int = 0
    var diceLimit: Int = 0
    
    init() {
        
    }
    
    func calculateDices(numberDice: String, diceLimit: String) -> DiceSet? {
        if let numberDiceInt = Int(numberDice), let diceLimitInt = Int(diceLimit) {
            let diceSet = DiceSet(totalDices: numberDiceInt)
            return diceSet
        } else {
            return nil
        }
    }
    
//    func get
    
    func getHitResume(numberDice: String, diceLimit: String) -> String{
        return String(localized: .LocalizableStrings.numberHitsResume(numberDice, diceLimit))
    }
    
    func getTitle() -> String {
        String(localized: .LocalizableStrings.hitTitle)
    }
    
    func getHitDices() -> String {
        return  String(localized: .LocalizableStrings.diceNumber)
    }
    
    func getButtonRoll() -> String {
        return String(localized: .LocalizableStrings.roll)
    }
}
