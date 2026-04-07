//
//  MenuFreeViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/04/26.
//

import Foundation
import Combine

class MenuFreeViewModel: ObservableObject {
    
    
    init() {
        
    }
    
    func onNumberHits() {
        print("Number of Hits")
    }
    
    func onHitRoll() {
        print("Hit Roll")
    }
    
    func onWondRoll() {
        print("WoondRoll")
    }
    
    func onSaveRoll() {
        print("SaveRoll")
    }

    func onFellNoPainRoll() {
        print("Fell No Pain")
    }

    
    public func getNumberOfHits() -> String {
        return "Express Mode"
    }
    
    public func getFreeFlow() -> String {
        return "Free Flow"
    }
}
