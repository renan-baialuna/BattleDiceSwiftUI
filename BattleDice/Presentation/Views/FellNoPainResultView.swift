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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VShower(title: "Hits:", value: String(viewModel.hits))
                VShower(title: "Dam:", value: String(viewModel.damage))
                VShower(title: "Wond:", value: String(viewModel.wonds))
                VShower(title: "FnP:", value: String(viewModel.limit))
                Spacer()
            }
            Text("\(viewModel.totalDetahs) Deaths")
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
                print("end")
            }, title: "End")
        }
        .padding(20)
        .background(Color.backSec)
    }
        
}

#Preview {
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
    })
        .preferredColorScheme(.dark)
}
