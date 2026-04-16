//
//  Dice3Structure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//
import SwiftUI

struct Dice3Structure: View {
    let size: CGFloat = 8
    
    var body: some View {
        HStack{
            VStack {
                Spacer()
                DiceCircle()
                    .offset(x:size, y:-size)
                
            }
            Spacer()
            VStack {
                Spacer()
                DiceCircle()
                Spacer()
            }
            Spacer()
            VStack {
                DiceCircle()
                    .offset(x:-size, y:size)
                Spacer()
            }
        }
    }
}
