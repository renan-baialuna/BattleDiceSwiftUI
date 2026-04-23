//
//  ValueIndicator.swift
//  BattleDice
//
//  Created by Renan Baialuna on 22/04/26.
//

import SwiftUI


struct ValueIndicator: View {
    let isSpecial: Bool
    let entry: String
    
    var body: some View {
        ZStack{
            Rectangle()
            .stroke(.detailSec, lineWidth: 8)
            .fill(.backMain)
            Text(entry)
                .foregroundStyle(isSpecial ? .detailSec : .detailMain)
                .font(BattleDice.AppFont.custom(.title))
        }
    }
}
