//
//  MenuView.swift
//  BattleDice
//
//  Created by Renan Baialuna on 20/03/26.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            VStack{
                Spacer()
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    SpecialButton(activation: {
                        print("teste")
                    },
                                  title: "secundo",
                                  isSeccond: true)
                    SpecialButton(
                        activation: {
                            print("teste")
                        },
                        title: "teste")
                    
                }.padding(.horizontal, 20)
                
                
            }
        }.backgroundStyle(.backSec)
        
    }
}

#Preview {
    MenuView()
        .preferredColorScheme(.dark)
}
