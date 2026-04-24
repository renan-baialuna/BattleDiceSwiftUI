//
//  DiceResultStructure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 23/04/26.
//

import SwiftUI


struct DiceResultStructure: View {
    let value: Int
    let circleWidth: CGFloat
    let diceWidth: CGFloat
    let type: DiceType
    let fillColor: Color
    init(
        value: Int,
        type: DiceType = .select
    ) {
        self.type = type
        self.value = value
        
        switch type {
        case .reroll:
            fillColor = .detailSec
            self.circleWidth = 60
            self.diceWidth = 45
        case .result:
            fillColor = .detailMain
            self.circleWidth = 60
            self.diceWidth = 45
        case .select:
            fillColor = .detailSec
            self.circleWidth = 90
            self.diceWidth = 60
        }

    }
    
    var body: some View {
        ZStack{
            Circle().fill(fillColor)
                .frame(width: circleWidth,height: circleWidth)
            DiceStructure(value: value, type: type)
                .frame(width: diceWidth,height: diceWidth)
        }
    }
}

#Preview {
    DiceResultStructure(value: 6, type: .select)
    DiceResultStructure(value: 6, type: .result)
    DiceResultStructure(value: 6, type: .reroll)
    .preferredColorScheme(.dark)
}
