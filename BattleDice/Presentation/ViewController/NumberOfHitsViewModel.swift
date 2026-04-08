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
    
    public func getStaticNumber() -> String {
        return "Static number"
    }
    
    public func getDiceNumber() -> String {
        return "Dice Number"
    }
}
