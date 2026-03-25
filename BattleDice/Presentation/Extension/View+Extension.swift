//
//  View+Extension.swift
//  BattleDice
//
//  Created by Renan Baialuna on 25/03/26.
//

import SwiftUI

extension View {
    func AppFont(_ style: AppFont.Style) -> some View {
        self.font(BattleDice.AppFont.custom(style))
    }
}
