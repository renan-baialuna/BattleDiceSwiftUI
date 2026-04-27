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
    case RollSelectionWithValue(state: FreeFlowStateEnum, value: Int)
    case RollResult(state: FreeFlowStateEnum, diceSet: DiceSet, limit: Int)
    case ReRoll(state: FreeFlowStateEnum, diceSet: DiceSet, limit: Int)
    
    case FellNoPainRoll
}
