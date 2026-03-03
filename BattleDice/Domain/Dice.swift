//
//  Dice.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

import Foundation

struct Dice {
    let value: Int
    let reroll: Bool
    
    init(reroll: Bool = false) {
        self.reroll = reroll
        self.value = Int.random(in: 1...6)
    }
    
    init(value: Int, reroll: Bool = false) {
        self.value = value
        self.reroll = reroll
    }
    
    
}
