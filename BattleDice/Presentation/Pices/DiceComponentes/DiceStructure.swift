//
//  DiceStructure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//
import SwiftUI

struct DiceStructure: View {
    let value: Int
    let type: DiceType
    init(value: Int, type: DiceType = .select) {
        self.type = type
        self.value = value
    }
    
    var body: some View {
        ZStack {
            DiceUpperStructure(type: type)
            switch value {
            case 1:
                Dice1Structure(type: type)
            case 2:
                Dice2Structure(type: type)
            case 3:
                Dice3Structure(type: type)
            case 4:
                Dice4Structure(type: type)
            case 5:
                Dice5Structure(type: type)
            default:
                Dice6Structure(type: type)
            }
        }
    }
}



#Preview {
    DiceStructure(value: 6, type: .select)
    DiceStructure(value: 6, type: .result)
    DiceStructure(value: 6, type: .reroll)
    .preferredColorScheme(.dark)
}
