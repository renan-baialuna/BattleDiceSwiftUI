//
//  NumberHitsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/04/26.
//

import SwiftUI

struct RollHitsView: View {
    @StateObject var viewModel: RollHitsViewModel
    @State var numberHits: String = "0"
    @State var selectionValue: Double = 6
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        
        let size: CGFloat = 55
        
        VStack {
            Text(viewModel.getTitle())
                .font(BattleDice.AppFont.custom(.title))
            Spacer()
            HSelector(
                numberHits: $numberHits,
                title: viewModel.getTitle()
            )
            Spacer()
            DiceHStack()
            DiceSplider(selectionValue: $selectionValue)
            
            Rectangle()
                .fill(.backSec)
                .frame(height: 5)
            Text(
                viewModel.getHitResume(
                    numberDice: numberHits,
                    diceLimit: String(Int(selectionValue))
                )
            )
                .font(BattleDice.AppFont.custom(.title))
            Rectangle()
                .fill(.backSec)
                .frame(height: 5)

            SpecialButton(activation: {
                print(viewModel.calculateDices(numberDice: numberHits, diceLimit: String(Int(selectionValue))))
            }, title: viewModel.getButtonRoll())
        }
        .lineSpacing(40)
        .padding(20)
        .background(Color.backSec)
    }
}

#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    RollHitsView(viewModel: RollHitsViewModel(), onRoute: { route in
        print(route)
        coordinator.navigate(to: route)
        
    }, onPop: {
        coordinator.pop()
    })
    .preferredColorScheme(.dark)
}
