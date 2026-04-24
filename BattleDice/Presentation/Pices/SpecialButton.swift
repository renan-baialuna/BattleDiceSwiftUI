//
//  SpecialButton.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/03/26.
//

import SwiftUI

struct SpecialButton: View {
    let activation: () -> ()
    let title: String
    let height: CGFloat = 60
    let cornerRadius: CGFloat = 20
    let bordersThickness: CGFloat = 3
    let backgroundColor: Color
    let detailColor: Color
    
    init(activation: @escaping () -> Void, title: String, isSeccond: Bool = false) {
        self.activation = activation
        self.title = title
        self.backgroundColor = isSeccond ? Color.backMain : Color.detailSec
        self.detailColor = isSeccond ? Color.detailSec :  Color.detailMain
    }
    
    var body: some View {
        Button(action: {
            activation()
        }) {
            Text(title) // Customize this Text view
                .padding()
                .foregroundColor(.white)
                .font(getFont(.subTitle))
                
        }
        .frame(maxWidth: .infinity,minHeight: height)
        .background(backgroundColor)
        .border(
            detailColor,
            width: bordersThickness
        )
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(
                detailColor,
                lineWidth: 4
            )
        )
    }
}

#Preview {
    SpecialButton(activation: {}, title: "teste")
        .preferredColorScheme(.dark)
}
