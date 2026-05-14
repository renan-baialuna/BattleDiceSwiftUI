//
//  DiceVStack.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/05/26.
//

import SwiftUI

struct DiceVStack: View {
    let size: CGFloat = 55

    var body: some View {
        VStack {
            DiceStructure(value: 6)
                .frame(width: size, height: size)
            DiceStructure(value: 5)
                .frame(width: size, height: size)
            DiceStructure(value: 4)
                .frame(width: size, height: size)
            DiceStructure(value: 3)
                .frame(width: size, height: size)
            DiceStructure(value: 2)
                .frame(width: size, height: size)
            DiceStructure(value: 1)
                .frame(width: size, height: size)
        }
        .padding(20)
    }
}
