//
//  NumberOfHitsViewModel.swift
//  BattleDice
//
//  Created by Renan Baialuna on 07/04/26.
//

import Foundation
import Combine

class NumberOfHitsViewModel: ObservableObject {
    init() {
        
    }
    
    public func generateDices(staticNumber: Int, diceNumber: Int, isD3: Bool) -> Int {
        var ret: Int = staticNumber
        let diceSet = DiceSet(totalDices: diceNumber)
        ret += isD3 ? diceSet.diceResult.calculateTotalD3() : diceSet.diceResult.calculateTotalD6()
        return ret
    }
    
    public func getStaticNumber() -> String {
        return "Static number"
    }
    
    public func getDiceNumber() -> String {
        return "Dice Number"
    }
    
    public func getD3Title() -> String {
        return "d3"
    }
    
    public func getD6Title() -> String {
        return "d6"
    }
    
    public func getContinue() -> String {
        return "Continue"
    }
    
    public func getTitle() -> String {
        return "Number of Hits"
    }
    
    public func getResume(staticNumber: String, diceNumber: String, isD3: Bool) -> String {
        let final = isD3 ? getD3Title() : getD6Title()
        return "\(staticNumber) + \(diceNumber) \(final)"
    }
}
