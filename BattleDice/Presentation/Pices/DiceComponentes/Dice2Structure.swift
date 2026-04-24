//
//  Dice2Structure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//
import SwiftUI

struct Dice2Structure: View {
    let size: CGFloat = 8
    
    let type: DiceType
    init(type: DiceType = .select) {
        self.type = type
    }
    
    var body: some View {
        HStack{
            VStack {
                Spacer()
                DiceCircle(type: type)
                    .offset(x:size, y:-size)
            }
            Spacer()
            VStack {
                DiceCircle(type: type)
                    .offset(x:-size, y:size)
                Spacer()
            }
        }
    }
}
