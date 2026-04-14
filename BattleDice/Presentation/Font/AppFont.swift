//
//  AppFont.swift
//  BattleDice
//
//  Created by Renan Baialuna on 25/03/26.
//

import SwiftUI

public enum AppFont {
    static func custom(_ style: Style) -> Font {
        switch style {
        case .title:
            return .title
        case .body:
            return .largeTitle
        case .caption:
            return .custom("YourFont-Light", size: 12)
        }
    }

    enum Style {
        case title
        case body
        case caption
    }
}


public enum AppColors {
    static func custom(_ color: ColorTypes) -> Color {
        switch color {
        case .mainMain:
            return .detailMain
        case .mainSec:
            return .detailSec
        case .backMain:
            return .backMain
        case .backSec:
            return .backSec
        }
    }
    
    enum ColorTypes {
        case backSec
        case backMain
        case mainSec
        case mainMain
    }
}
