//
//  MenuViewController.swift
//  BattleDice
//
//  Created by Renan Baialuna on 25/03/26.
//

import Foundation
import Combine

class MenuViewModel: ObservableObject {
    
    
    init() {
        
    }
    
    func moveXpress() {
        print("express!")
    }
    
    func moveFreeFlow() {
        print("Free Flow")
    }
    
    public func getXpressTitle() -> String {
        return "Express Mode"
    }
    
    public func getFreeFlow() -> String {
        return "Free Flow"
    }
}
