//
//  DiceStructure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//
import SwiftUI

struct DiceStructure: View {
    let value: Int
    init(value: Int) {
        self.value = value
    }
    
    var body: some View {
        ZStack {
            DiceUpperStructure()
            switch value {
            case 1:
                Dice1Structure()
            case 2:
                Dice2Structure()
            case 3:
                Dice3Structure()
            case 4:
                Dice4Structure()
            case 5:
                Dice5Structure()
            default:
                Dice6Structure()
            }
        }
    }
}
