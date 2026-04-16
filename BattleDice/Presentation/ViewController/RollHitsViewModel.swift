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
    @Published var resultNumber: Int = 0
    
    init() {
        
    }
    
    func calculateValues(numberDice: Int, diceLimit: Int) -> Int {
        
        
        return numberDice * diceLimit
    }
    
}
