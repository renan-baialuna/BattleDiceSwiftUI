//
//  Keyword.swift
//  BattleDice
//
//  Created by Renan Baialuna on 13/03/26.
//

import Foundation

struct Keyword: Equatable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let phase: PhasesEnum
}
