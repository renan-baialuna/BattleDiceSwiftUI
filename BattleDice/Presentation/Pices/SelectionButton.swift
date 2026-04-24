//
//  SelectionButton.swift
//  BattleDice
//
//  Created by Renan Baialuna on 08/04/26.
//

import SwiftUI


struct SelectionButton: View {
    let activation: () -> ()
    let title: String
    let primary: Bool
    
    var body: some View {
        Button(action: {
            activation()
        }) {
            Text(title)
                .font(getFont(.subTitle))
                .foregroundStyle(primary ? .detailMain : .detailSec)
                .frame(width: 112, height: 80)
                .background(
                    primary ? .detailSec : .backMain,
                    in: RoundedRectangle(cornerRadius: 8)
                )
        }
    }
}

#Preview {
    SelectionButton(activation: {
        print("test")
    }, title: "test", primary: true)
    SelectionButton(activation: {
        print("test")
    }, title: "test", primary: false)
    .preferredColorScheme(.dark)
}
