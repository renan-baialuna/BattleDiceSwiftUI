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
    
    @StateObject var viewModel: ExpressSelectionViewModel
    
    let keywords = KeywordControlerSingleton().getAllKeywords()
    
    var body: some View {
        VStack {
            Text(viewModel.getResume(total: Int(total) ?? 0, hit: Int(hitLimit), wond: Int(wondLimit), save: Int(saveLimit)))
                .font(getFont(.subTitle))
                .lineLimit(2, reservesSpace: true)
                .multilineTextAlignment(.center)
            
            HStack {
                VDiceStackSlider(
                    selectionValue: $hitLimit,
                    title: viewModel.getHitTitle()
                )
                VDiceStackSlider(
                    selectionValue: $wondLimit,
                    title: viewModel.getWondTitle()
                )
                VDiceStackSlider(
                    selectionValue: $saveLimit,
                    title: viewModel.getSaveTitle()
                )
            }
            
            ZStack {
                Rectangle().fill(.backMain)
                ScrollView {
                    FlowLayout(spacing: 12) {
                        ForEach(keywords, id: \.self) { keyword in
                            ZStack {
                                Capsule()
                                    .stroke(.detailSec,lineWidth: 6)
                                    .fill(.backMain)
                                Text(keyword.name)
                                    .font(getFont(.text))
                                    .padding(3)
                            }
                        }
                    }
                    .onTapGesture {
                        print("foi")
                    }
                }
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
    let viewModel = ExpressSelectionViewModel()
    ExpressSelectionView(viewModel: viewModel)
        .preferredColorScheme(.dark)
}
