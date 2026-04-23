//
//  HitResultsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 22/04/26.
//

import SwiftUI

struct HitResultsView: View {
    
    @StateObject var viewModel: HitResultsViewModel
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        
        
        VStack {
            Text("Title")
            
            DiceResultShower(
                results: viewModel.diceSet.diceResult,
                limit: viewModel.limit
            )
            .padding(20)
            
//            DiceStructure(value: 1)
                
                
                
            
            Spacer()
            SpecialButton(activation: {
                print("foi")
            }, title: "continue")
            .padding(20)
        }
        .background(Color.backSec)
    }
}



#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    HitResultsView(
        viewModel: HitResultsViewModel(
            diceSet: DiceSet(totalDices: 10),
            limit: 4),
        onRoute: { route in
            print(route)
            coordinator.navigate(to: route)
        
        }, onPop: {
            coordinator.pop()
        }
    )
    .preferredColorScheme(.dark)
}
