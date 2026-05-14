//
//  VDiceStackSlider.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/05/26.
//

import SwiftUI

struct VDiceStackSlider: View {
    @Binding var selectionValue: Double
    let title: String
    let height: CGFloat = 370
    let width: CGFloat = 10
    
    var body: some View {
        VStack {
            Text(title)
                .font(getFont(.subTitle))
            HStack{
                DiceVStack()
                ZStack {
                    DiceSplider(selectionValue: $selectionValue)
                        .rotationEffect(.degrees(-90))
                        .frame(width: height, height: width)
                }
                .frame(width: width, height: height)
            }
        }
    }
}
