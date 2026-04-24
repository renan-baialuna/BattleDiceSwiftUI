//
//  HitsRerollsSelectorView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import SwiftUI

struct HitsRerollsSelectorView: View {
    @StateObject var viewModel: HitsRerollsSelectorViewModel
    @State var numberHits: String = "0"
    @State var selectionValue: Double = 6
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        VStack {
            Text(viewModel.getRerollsTitle())
                .font(getFont(.title))
            Text(viewModel.getRangeDescription(limit: Int(selectionValue)))
                .font(getFont(.subTitle))
            DiceSplider(selectionValue: $selectionValue)
            DiceHStack()
            Rectangle()
                .fill(.backSec)
                .frame(height: 5)
            Spacer()
            
            HShower(
                title: viewModel.rerollsSubtitle(),
                value: viewModel.getTotalRerolls(
                    limit: Int(selectionValue)
                )
            )
            
            Rectangle()
                .fill(.backSec)
                .frame(height: 10)
            SpecialButton(activation: {
                onRoute(
                    .HitResult(
                        diceSet: viewModel.reroll(newLimit: Int(selectionValue)),
                        limit: viewModel.limit
                    )
                )
                
            }, title: viewModel.getContinueButton())
        }.padding(20)
        .background(Color.backSec)
    }
}



#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    let viewModel = HitsRerollsSelectorViewModel(
        diceSet: DiceSet(totalDices: 10),
        limit: 4
    )
    HitsRerollsSelectorView(
        viewModel: viewModel,
        onRoute: { route in
            print(route)
            coordinator.navigate(to: route)
            
        }, onPop: {
            coordinator.pop()
        }
    )
    .preferredColorScheme(.dark)
}
