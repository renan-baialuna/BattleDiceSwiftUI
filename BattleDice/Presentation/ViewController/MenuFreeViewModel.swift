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
    
    public func getNumberHitsText() -> String {
        return "Number of Hits"
    }
    
    public func getHitsText() -> String {
        return "Hit Roll"
    }
    
    public func getWondsText() -> String {
        return "Wond Roll"
    }
    
    public func getSaveText() -> String {
        return "Save Roll"
    }
    
    public func getFellNoPainText() -> String {
        return "FnP Roll"
    }
    

}
