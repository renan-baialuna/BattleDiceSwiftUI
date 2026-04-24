//
//  AppColors.swift
//  BattleDice
//
//  Created by Renan Baialuna on 24/04/26.
//

import SwiftUI

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
