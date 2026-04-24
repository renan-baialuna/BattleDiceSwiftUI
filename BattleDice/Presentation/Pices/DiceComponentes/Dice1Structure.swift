//
//  Dice1Structure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//
import SwiftUI

struct Dice1Structure: View {
    
    let type: DiceType
    init(type: DiceType = .select) {
        self.type = type
    }
    
    var body: some View {
        HStack{
            Spacer()
            VStack {
                Spacer()
                DiceCircle(type: type)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    Dice1Structure()
    .preferredColorScheme(.dark)
}

