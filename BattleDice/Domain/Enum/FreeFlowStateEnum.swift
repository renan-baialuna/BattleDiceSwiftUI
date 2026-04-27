//
//  FreeFlowState.swift
//  BattleDice
//
//  Created by Renan Baialuna on 27/04/26.
//


enum FreeFlowStateEnum {
    case hit
    case wond
    case save
    
    func next(now: FreeFlowStateEnum) -> FreeFlowStateEnum {
        if now == .hit {
            return .wond
        } else {
            return .save
        }
    }
}
