//
//  View+Extension.swift
//  BattleDice
//
//  Created by Renan Baialuna on 25/03/26.
//

import SwiftUI



extension View {
    
//    func AppFont(_ style: AppFont.Style) -> some View {
//        self.font(BattleDice.AppFont.custom(style))
//    }
    
    func getFont(_ style: FontStyleEnum) -> Font {
        switch style {
        case .title:
            return .largeTitle
        case .subTitle:
            return .title
        case .text:
            return .body
        }
    }
    

}

