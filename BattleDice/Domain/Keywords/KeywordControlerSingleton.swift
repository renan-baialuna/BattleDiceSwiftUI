//
//  KeywordControlerSingleton.swift
//  BattleDice
//
//  Created by Renan Baialuna on 13/03/26.
//


public class KeywordControlerSingleton {
    static let shared = KeywordControlerSingleton()
    
    let rerollHits = Keyword(name: "Reroll Hits", description: "Reroll hits roll in a phase", phase: .hit)
    let criticalHits = Keyword(name: "Critical Hits", description: "Custom Critical Hits", phase: .hit)
    let lethalHits = Keyword(name: "Lethal Hits", description: "Critical Hits skip wond rolls", phase: .hit)
    let sustainHits = Keyword(name: "Sustain Hits", description: "Critical Hits generate aditional hits", phase: .hit)
    
    let rerollWonds = Keyword(name: "Reroll Wonds", description: "Reroll wonds roll in a phase", phase: .wond)
    let criticalWonds = Keyword(name: "Critical Wonds", description: "Custom Critical Wonds", phase: .wond)
    let devastatingWonds = Keyword(name: "Devastating Wonds", description: "Critical Wonds skip save", phase: .wond)
    
    func getAllKeywords() -> [Keyword] {
        return [
            rerollHits,
            criticalHits,
            lethalHits,
            sustainHits,
            rerollWonds,
            criticalWonds,
            devastatingWonds
        ]
    }
    
    func getKeywordValue(value: Int?, key: Keyword) -> KeyValue {
        return KeyValue(key: key, value: value)
    }
}

struct KeyValue {
    
    let key: Keyword
    let value: Int?
}
