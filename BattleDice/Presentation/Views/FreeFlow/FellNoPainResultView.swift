//
//  FellNoPainResultView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 30/04/26.
//

import SwiftUI

struct FellNoPainResultView: View {
    @StateObject var viewModel: FellNoPainResultViewModel
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    let onPopToRoot: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VShower(
                    title: viewModel.getHitsTitle(),
                    value: String(viewModel.hits)
                )
                VShower(
                    title: viewModel.getDamageTitle(),
                    value: String(viewModel.damage)
                )
                VShower(
                    title: viewModel.getWondsTitle(),
                    value: String(viewModel.wonds)
                )
                VShower(
                    title: viewModel.getFnPTitle(),
                    value: String(viewModel.limit)
                )
                Spacer()
            }
            Text(viewModel.getDeaths())
                .font(getFont(.title))
            
            ScrollView {
                VStack {
                    ForEach(viewModel.allDiceCellInfo) { info in
                        HStack {
                            ZStack {
                                Rectangle()
                                    .fill(.backMain)
                                    .stroke(.detailMain, lineWidth: 4)
                                    .frame(width: 100)
                                Text("\(info.success) / \(info.total)")
                                    .font(getFont(.subTitle))
                                    .backgroundStyle(.backMain)
                            }
                            ScrollView {
                                HStack {
                                    ForEach(info.diceSet.dices) { dice in
                                    
                                        DiceResultStructure(value: dice.value, type: .result)
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            
            SpecialButton(activation: {
                onPopToRoot()
            }, title: viewModel.getButtonTitle())
        }
        .padding(20)
        .background(Color.backSec)
    }
        
}

#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    var viewModel = FellNoPainResultViewModel(
        diceSets:
            [DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2),
             DiceSet(totalDices: 2)
            ],
        hits: 5,
        damage: 2,
        wonds: 3,
        limit: 5)
    FellNoPainResultView(viewModel: viewModel, onRoute: { route in
        print("foi")
    }, onPop: {
        print("foi")
    }, onPopToRoot: {
        coordinator.popToRoot()
    })
        .preferredColorScheme(.dark)
}
