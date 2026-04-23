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
    
    
}
