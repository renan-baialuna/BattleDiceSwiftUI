//
//  Calculations.swift
//  BattleDice
//
//  Created by Renan Baialuna on 05/03/26.
//


public struct Calculations {
    static let shared = Calculations()
    private init() {}
    
    func checkLimits(entry: Int) -> Int {
        if entry <= 0 {
            return 1
        } else {
            if entry > 6 {
                return 6
            } else {
                return entry
            }
        }
    }
} 
