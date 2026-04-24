//
//  HShower.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import SwiftUI

struct HShower: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack{
            Text(title)
                .font(getFont(.subTitle))
            ZStack{
                Rectangle()
                    .fill(.detailSec)
                    .cornerRadius(5)
                    .frame(width: 80, height: 40)
                Text(value)
                .font(getFont(.subTitle))
                .foregroundStyle(.detailMain)
            }
            
        }
    }
}
