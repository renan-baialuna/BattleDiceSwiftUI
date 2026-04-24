//
//  DiceGridShower.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import SwiftUI

struct DiceGridShower: View {
    let dices: [Dice]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(dices) { dice in
                    DiceResultStructure(value: dice.value, type: dice.reroll ? .reroll : .result)
                }
            }
        }
    }
}
