//
//  NumberOfHitsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 07/04/26.
//

import SwiftUI

struct NumberOfHitsView: View {
    @StateObject var viewModel = NumberOfHitsViewModel()
    @State var d3Selected: Bool = false
    @State var numberStatic: String = "0"
    @State var numberDice: String = "0"
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        VStack {
            Text(viewModel.getTitle())
                .font(BattleDice.AppFont.custom(.body))
            Spacer()
            HSelector(numberHits: $numberStatic, title: viewModel.getStaticNumber())
            HSelector(numberHits: $numberDice, title: viewModel.getDiceNumber())
            
            HStack{
                SelectionButton(activation: {
                    d3Selected = true
                }, title: viewModel.getD3Title(), primary: d3Selected)
                SelectionButton(activation: {
                    d3Selected = false
                }, title: viewModel.getD6Title(), primary: !d3Selected)
            }
            .padding(20)
            Text(
                viewModel.getResume(
                    staticNumber: numberStatic,
                    diceNumber: numberDice,
                    isD3: d3Selected
                )
            )
            .font(BattleDice.AppFont.custom(.body))
            Spacer()
            SpecialButton(activation: {
                let value = viewModel.generateDices(
                    staticNumber: Int(numberStatic) ?? 0,
                    diceNumber: Int(numberDice) ?? 0,
                    isD3: self.d3Selected)
                
                onRoute(.HitRollWithValues(value: value))
            }, title: viewModel.getContinue())
        }
        .lineSpacing(40)
        .padding(20)
        .background(Color.backSec)
    }
    
}


#Preview {
    @StateObject var coordinator = AppCoordinator()
    NumberOfHitsView(onRoute: { route in
        print(route)
        coordinator.navigate(to: route)
        
    }, onPop: {
        coordinator.pop()
    })
    .preferredColorScheme(.dark)
    
}
