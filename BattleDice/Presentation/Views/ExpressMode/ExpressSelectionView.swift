//
//  ExpressSelectionView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 13/05/26.
//

import SwiftUI

struct ExpressSelectionView: View {
    @State var total: String = "0"
    @State var hitLimit: Double = 1.0
    @State var wondLimit: Double = 1.0
    @State var saveLimit: Double = 1.0
    
    var body: some View {
        VStack {
            Text("30 Hits on 3+, Wonds on 3+, Saves on 5+")
                .font(getFont(.subTitle))
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.center)
            
            HStack {
                VDiceStackSlider(selectionValue: $hitLimit, title: "hit")
                VDiceStackSlider(selectionValue: $wondLimit, title: "wond")
                VDiceStackSlider(selectionValue: $saveLimit, title: "save")
            }
            ZStack {
                Rectangle().fill(.backMain)
                
            }
            
            HSelector(
                numberHits: $total,
                title: "Hit Rolls"
            )
            SpecialButton(activation: {
                print("foi")
            }, title: "Roll")
        }
        .padding(20)
        .background(Color.backSec)
    }
}



#Preview {
    ExpressSelectionView()
        .preferredColorScheme(.dark)
}
