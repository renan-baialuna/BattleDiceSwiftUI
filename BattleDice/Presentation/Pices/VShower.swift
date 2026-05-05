//
//  VShower.swift
//  BattleDice
//
//  Created by Renan Baialuna on 04/05/26.
//

import SwiftUI

struct VShower: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack{
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
