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
    init(size: CGFloat = 12, stroke: CGFloat = 2) {
        self.size = size
        self.stroke = stroke
    }
    
    var body: some View {
        Circle()
            .fill(.detailSec)
            .stroke(.detailMain, lineWidth: stroke)
            .frame(width: size, height: size)
    }
}
