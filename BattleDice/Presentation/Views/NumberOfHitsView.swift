//
//  NumberOfHitsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 07/04/26.
//

import SwiftUI

struct NumberOfHitsView: View {
    @StateObject var viewModel = NumberOfHitsViewModel()
    
    
    @State var numberHits: String = "0"
    @State var numberDice: String = "0"
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        
        VStack {
            
            Text("titulo")
            Spacer()
            HSelector(numberHits: $numberHits, title: viewModel.getStaticNumber())
            HSelector(numberHits: $numberDice, title: viewModel.getDiceNumber())
            
            Spacer()
            SpecialButton(activation: {
                print(numberDice)
                print(numberHits)
            }, title: "continue")
            
            
        }
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
