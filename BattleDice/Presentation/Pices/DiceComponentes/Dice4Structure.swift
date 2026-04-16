//
//  Dice4Structure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//

import SwiftUI

struct Dice4Structure: View {
    let size: CGFloat = 8
    
    var body: some View {
        HStack{
            VStack {
                DiceCircle()
                    .offset(x:size, y:size)
                Spacer()
                DiceCircle()
                    .offset(x:size, y:-size)
            }
            Spacer()
            VStack {
                DiceCircle()
                    .offset(x:-size, y:size)
                Spacer()
                DiceCircle()
                    .offset(x:-size, y:-size)
            }
        }
    }
}
