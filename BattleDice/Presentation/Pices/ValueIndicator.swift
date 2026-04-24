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
                .font(getFont(.subTitle))
        }
    }
}

#Preview {
    @StateObject var coordinator = AppCoordinator()
    ValueIndicator(isSpecial: false, entry: "test")
    ValueIndicator(isSpecial: true, entry: "test")
    .preferredColorScheme(.dark)
    
}
