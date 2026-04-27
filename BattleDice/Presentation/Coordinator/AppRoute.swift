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
    case HitsRerolls(diceSet: DiceSet, limit: Int)
    case WondRoll
    case WondRollWithValues(value: Int)
    case SaveRoll
    case SaveRollWithValues(value: Int)
    case RollSelectionWithValue(state: FreeFlowStateEnum, value: Int)
    case RollResult(state: FreeFlowStateEnum, diceSet: DiceSet, limit: Int)
    
    case FellNoPainRoll
}
