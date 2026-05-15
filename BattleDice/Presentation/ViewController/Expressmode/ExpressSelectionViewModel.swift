//
//  ExpressSelectionViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 14/05/26.
//

import Foundation
import Combine

class ExpressSelectionViewModel: ObservableObject {
    
    
    func getHitTitle() -> String {
        return String(localized: .LocalizableStrings.hitsTitleSimple)
    }
    
    func getWondTitle() -> String {
        return String(localized: .LocalizableStrings.wondsTitleSimple)
    }
    
    func getSaveTitle() -> String {
        return String(localized: .LocalizableStrings.saveTitleSimple)
    }
    
    func getResume(total: Int, hit: Int, wond: Int, save: Int) -> String {
        return String(localized: .LocalizableStrings.resumeExpress(String(total), String(hit), String(wond), String(save)))
    }
    
    
    
    
}
