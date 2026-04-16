//
//  DiceUpperStructure.swift
//  BattleDice
//
//  Created by Renan Baialuna on 15/04/26.
//

import SwiftUI


struct DiceUpperStructure: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(.detailMain, lineWidth: 3)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.backMain)
            )
    }
}
