//
//  DiceSplider.swift
//  BattleDice
//
//  Created by Renan Baialuna on 16/04/26.
//

import SwiftUI

struct DiceSplider: View {
    @Binding var selectionValue: Double
    
    var body: some View {
        Slider(value: $selectionValue,
               in: 1...6,
               onEditingChanged: { editing in
                if !editing {
                    DispatchQueue.main.async {
                        selectionValue = selectionValue.rounded()
                    }
                }
            }
        )
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .tint(.detailSec)
        .accentColor(.backSec)
        .onAppear {
            UISlider.appearance().thumbTintColor = .detailMain
        }
    }
}


#Preview {
    @State var selectionValue: Double = 6
    
    DiceSplider(selectionValue: $selectionValue)
        .preferredColorScheme(.dark)
}
