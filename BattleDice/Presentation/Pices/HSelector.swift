//
//  HSelector.swift
//  BattleDice
//
//  Created by Renan Baialuna on 08/04/26.
//

import SwiftUI


struct HSelector: View {
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
            HStack {
                Spacer()
                Text(title)
                    .font(getFont(.subTitle))
                    .frame(width: 120)
                    .multilineTextAlignment(.center)
                    .lineSpacing(1)
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

#Preview {
    @State var numberStatic: String = "0"
    
    HSelector(numberHits: $numberStatic, title: "test", subText: "teste 2")
        .preferredColorScheme(.dark)
}
