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
    
    var body: some View {
        VStack {
            Spacer()
            SpecialButton(
                activation: {
                    onRoute(.Menu)
                },
                title: viewModel.getNumberOfHits()
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
        
    })
        .preferredColorScheme(.dark)
}
