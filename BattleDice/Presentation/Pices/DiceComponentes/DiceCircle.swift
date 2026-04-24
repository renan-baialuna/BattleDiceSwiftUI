//
//  DiceCircle.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//

import SwiftUI

struct DiceCircle: View {
    let size: CGFloat
    let stroke: CGFloat
    let strokeColor: Color
    let fillColor: Color
    
    init(/*size: CGFloat = 12, stroke: CGFloat = 2, */type: DiceType = .select) {
//        self.size = size
//        self.stroke = stroke
        
        switch type {
        case .select:
            self.strokeColor = .detailMain
            self.fillColor = .detailSec
            self.size = 12
            self.stroke = 2
        case .result:
            self.strokeColor = .detailSec
            self.fillColor = .detailMain
            self.size = 8
            self.stroke = 1
        case .reroll:
            self.strokeColor = .detailMain
            self.fillColor = .detailSec
            self.size = 8
            self.stroke = 1
        }
    }
    
    var body: some View {
        Circle()
            .fill(fillColor)
            .stroke(strokeColor, lineWidth: stroke)
            .frame(width: size, height: size)
    }
}

#Preview {
    DiceCircle(type: .reroll)
    DiceCircle(type: .select)
    DiceCircle(type: .result)
    .preferredColorScheme(.dark)
}
