//
//  MenuFreeView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/04/26.
//

import SwiftUI

struct MenuFreeView: View {
    @StateObject var viewModel = MenuFreeViewModel()
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            SpecialButton(
                activation: {
                    onRoute(.NumberHits)
                },
                title: viewModel.getNumberHitsText()
            )
            Spacer(minLength: 45)
            SpecialButton(
                activation: {
                    onRoute(.HitRoll)
                },
                title: viewModel.getHitsText()
            )
            Spacer(minLength: 45)
            SpecialButton(
                activation: {
//                    onRoute(.Menu)
                },
                title: viewModel.getWondsText()
            )
            Spacer(minLength: 45)
            SpecialButton(
                activation: {
//                    onRoute(.Menu)
                },
                title: viewModel.getSaveText()
            )
            Spacer(minLength: 45)
            SpecialButton(
                activation: {
//                    onRoute(.Menu)
                },
                title: viewModel.getFellNoPainText()
            )
            
            
            Spacer()
            
        }.padding(.horizontal, 20)
        .background(Color.backSec)
    }
}

#Preview {
    @StateObject var coordinator = AppCoordinator()
    MenuFreeView(onRoute: { route in
        print(route)
        coordinator.navigate(to: route)
        
    }, onPop: {
        coordinator.pop()
    })
        .preferredColorScheme(.dark)
}
