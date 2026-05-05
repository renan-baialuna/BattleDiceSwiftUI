//
//  FellNoPainSelectionViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 28/04/26.
//

import Foundation
import Combine

class FellNoPainSelectionViewModel: ObservableObject {
    let initial: Int
    
    init(initial: Int) {
        self.initial = initial
    }
    
    func getTitle() -> String {
        return String(localized: .LocalizableStrings.fnPRoll)
    }
    
    func getSuccess() -> String {
        return String(localized: .LocalizableStrings.successWonds)
    }
    
    func getDamageperWond() -> String {
        return String(localized: .LocalizableStrings.damagePerWond)
    }
    
    func getWondsModel() -> String {
        return String(localized: .LocalizableStrings.wondsPerModel)
    }
    
    func getButtonText() -> String {
        return String(localized: .LocalizableStrings.roll)
    }
    
    func generateDiceSets(size: Int, count: Int) -> [DiceSet] {
        var ret: [DiceSet] = []
        for _ in 0...count {
            ret.append(DiceSet(totalDices: size))
        }
        return ret
    }
    
}
