//
//  NumberHitsView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/04/26.
//

import SwiftUI

struct RollHitsView: View {
    @StateObject var viewModel = RollHitsViewModel()
    @State var numberHits: String = "0"
    @State private var selectionValue: Double = 6
    
    
    let onRoute: (AppRoute) -> Void
    let onPop: () -> Void
    
    var body: some View {
        
        let size: CGFloat = 55
        
        VStack {
            Text("Hit Roll")
                .font(BattleDice.AppFont.custom(.title))
            Spacer()
            HSelector(numberHits: $numberHits, title: "Hit Rolls")
            Spacer()
            DiceHStack()
            DiceSplider(selectionValue)
                
            
            Rectangle()
                .fill(.backSec)
                .frame(height: 40)

            SpecialButton(activation: {
                print(numberHits)
            }, title: "continue")
        }
        .lineSpacing(40)
        .padding(20)
        .background(Color.backSec)
        
        
    }
}




#Preview {
    @Previewable @StateObject var coordinator = AppCoordinator()
    RollHitsView(onRoute: { route in
        print(route)
        coordinator.navigate(to: route)
        
    }, onPop: {
        coordinator.pop()
    })
    .preferredColorScheme(.dark)
}
