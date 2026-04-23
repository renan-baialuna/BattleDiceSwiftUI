//
//  AppRoute.swift
//  BattleDice
//
//  Created by Renan Baialuna on 07/04/26.
//


enum AppRoute: Hashable {
    case Menu
    case FreeMenu
    
    case NumberHits
    case HitRoll
    case HitRollWithValues(value: Int)
    case HitResult(diceSet: DiceSet, limit: Int)
    case WondRoll
    case SaveRoll
    case FellNoPainRoll
}
