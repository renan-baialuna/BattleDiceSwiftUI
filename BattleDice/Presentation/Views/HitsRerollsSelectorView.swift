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
            Text("Re-Roll Hits")
                .font(getFont(.title))
            Text("1 to \(Int(selectionValue))")
                .font(getFont(.subTitle))
            DiceSplider(selectionValue: $selectionValue)
            DiceHStack()
            Rectangle()
                .fill(.backSec)
                .frame(height: 5)
            Spacer()
            
            HStack{
                Text("Rerolls:")
                    .font(getFont(.subTitle))
                ZStack{
                    Rectangle()
                        .fill(.detailSec)
                        .cornerRadius(5)
                        .frame(width: 80, height: 40)
                    Text(viewModel.getTotalRerolls(limit: Int(selectionValue)))
                        .font(getFont(.subTitle))
                        .foregroundStyle(.detailMain)
                }
                
            }
            Rectangle()
                .fill(.backSec)
                .frame(height: 10)
            SpecialButton(activation: {
                viewModel.reroll(newLimit: Int(selectionValue)).printResults()
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
