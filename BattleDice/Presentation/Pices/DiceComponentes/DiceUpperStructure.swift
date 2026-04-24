//
//  DiceUpperStructure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//

import SwiftUI


struct DiceUpperStructure: View {
    let strokeColor: Color
    let fillColor: Color
    
    init(type: DiceType = .select) {
        switch type {
        case .select:
            self.strokeColor = .detailMain
            self.fillColor = .backMain
        case .result:
            self.strokeColor = .detailSec
            self.fillColor = .backSec
        case .reroll:
            self.strokeColor = .detailMain
            self.fillColor = .backMain
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(strokeColor, lineWidth: 3)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(fillColor)
            )
    }
}

#Preview {
    DiceUpperStructure(type: .select)
    DiceUpperStructure(type: .result)
    DiceUpperStructure(type: .reroll)
    .preferredColorScheme(.dark)
}

