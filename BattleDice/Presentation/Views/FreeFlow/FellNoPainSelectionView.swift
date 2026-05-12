//
//  FellNoPainSelectionView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 27/04/26.
//

import SwiftUI

struct FellNoPainSelectionView: View {
    @StateObject var viewModel: FellNoPainSelectionViewModel
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    @State var total: String = "0"
    @State var damageWond: String = "0"
    @State var wondsPerModel: String = "0"
    
    @State var selectionValue: Double = 6
    
    var body: some View {
        
        VStack{
            Text(viewModel.getTitle())
                .font(getFont(.title))
            
            VSelector(
                numberHits: $total,
                title: viewModel.getSuccess()
            )
            
            VSelector(
                numberHits: $damageWond,
                title: viewModel.getDamageperWond()
            )
            
            VSelector(
                numberHits: $wondsPerModel,
                title: viewModel.getWondsModel()
            )
            
            Spacer()
            
            DiceSplider(selectionValue: $selectionValue)
            DiceHStack()
            
            
            SpecialButton(activation: {
                let diceSets = viewModel.generateDiceSets(
                    size: Int(damageWond)!,
                    count: Int(total)!
                )
                onRoute(.FellNoPainResult(
                    diceSets: diceSets,
                    hits: Int(total)!,
                    damage: Int(damageWond)!,
                    wonds: Int(wondsPerModel)!,
                    limit: Int(selectionValue)
                ))
            }, title: viewModel.getButtonText())
            
        }
        .background(Color.backSec)
        .padding(.trailing, 20)
        .padding(.leading, 20)
    }
}


#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    FellNoPainSelectionView(viewModel:
        FellNoPainSelectionViewModel(initial: 10), onRoute: { route in
            print(route)
            coordinator.navigate(to: route)
            
        }, onPop: {
            coordinator.pop()
        }
    )
        .preferredColorScheme(.dark)
    
    
}
