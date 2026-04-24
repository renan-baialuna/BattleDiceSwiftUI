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



