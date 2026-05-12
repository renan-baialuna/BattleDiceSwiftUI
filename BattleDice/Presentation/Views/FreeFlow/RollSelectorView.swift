//
//  NumberHitsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/04/26.
//

import SwiftUI

struct RollSelectorView: View {
    @StateObject var viewModel: RollSelectorViewModel
    @State var numberHits: String = "0"
    @State var selectionValue: Double = 6
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        
        VStack {
            Text(viewModel.getTitle())
                .font(getFont(.title))
            Spacer()
            HSelector(
                numberHits: $numberHits,
                title: viewModel.getDicesString()
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
            .font(getFont(.subTitle))
            Rectangle()
                .fill(.backSec)
                .frame(height: 5)

            SpecialButton(activation: {
                onRoute(viewModel.getRoute(diceNumber: Int(numberHits)!, newLimit: Int(selectionValue)))
            }, title: viewModel.getButtonRoll())
        }
        .lineSpacing(40)
        .padding(20)
        .background(Color.backSec)
    }
}

#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    RollSelectorView(viewModel: RollSelectorViewModel(state: .wond), onRoute: { route in
        print(route)
        coordinator.navigate(to: route)
        
    }, onPop: {
        coordinator.pop()
    })
    .preferredColorScheme(.dark)
}
