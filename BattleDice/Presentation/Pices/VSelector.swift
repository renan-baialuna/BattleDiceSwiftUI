//
//  VSelector.swift
//  BattleDice
//
//  Created by Renan Baialuna on 28/04/26.
//

import SwiftUI

struct VSelector: View {
    @Binding var numberHits: String
    let title: String
    let subText: String
    
    init(numberHits: Binding<String>, title: String, subText: String = "") {
        self._numberHits = numberHits
        self.title = title
        self.subText = subText
    }
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text(title)
                    .font(getFont(.subTitle))
                    .multilineTextAlignment(.center)
                    .lineSpacing(1)
                    .lineLimit(1)
                TextField(subText, text: $numberHits)
                    .padding(.vertical, 11)
                    .background(
                        Color.detailMain,
                        in: RoundedRectangle(cornerRadius: 8)
                    )
                    .font(getFont(.subTitle))
                    .foregroundStyle(.detailSec)
                    .frame(width: 80)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Spacer()
            }
        }
    }
}
