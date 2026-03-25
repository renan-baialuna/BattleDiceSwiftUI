//
//  MenuView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 20/03/26.
//

import SwiftUI

struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            SpecialButton(
                activation: viewModel.moveXpress,
                title: viewModel.getXpressTitle()
            )
            Spacer()
            SpecialButton(
                activation: viewModel.moveFreeFlow,
                title: viewModel.getFreeFlow()
            )
            Spacer()
            
        }.padding(.horizontal, 20)
        .background(Color.backSec)
    }
}

#Preview {
    MenuView()
        .preferredColorScheme(.dark)
}
