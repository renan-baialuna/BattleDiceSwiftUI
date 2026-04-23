//
//  DiceResultShower.swift
//  BattleDice
//
//  Created by Renan Baialuna on 22/04/26.
//

import SwiftUI

struct DiceResultShower: View {
    let results: DiceResult
    let limit: Int
    let dimensions: CGFloat = 50
    
    
    var body: some View {
        HStack {
            VStack {
                DiceStructure(value: 1)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 1, entry: String(results.totalResult[0]))
                    .frame(width: dimensions, height: dimensions)
            }
            Rectangle()
                .frame(width: 1, height: 10)
                .foregroundStyle(.backSec)
            VStack {
                DiceStructure(value: 2)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 2, entry: String(results.totalResult[1]))
                    .frame(width: dimensions, height: dimensions)
            }
            Rectangle()
                .frame(width: 1, height: 10)
                .foregroundStyle(.backSec)
            VStack {
                DiceStructure(value: 3)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 3, entry: String(results.totalResult[2]))
                    .frame(width: dimensions, height: dimensions)
            }
            Rectangle()
                .frame(width: 1, height: 10)
                .foregroundStyle(.backSec)
            VStack {
                DiceStructure(value: 4)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 4, entry: String(results.totalResult[3]))
                    .frame(width: dimensions, height: dimensions)
            }
            Rectangle()
                .frame(width: 1, height: 10)
                .foregroundStyle(.backSec)
            VStack {
                DiceStructure(value: 5)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 5, entry: String(results.totalResult[4]))
                    .frame(width: dimensions, height: dimensions)
            }
            Rectangle()
                .frame(width: 1, height: 10)
                .foregroundStyle(.backSec)
            VStack {
                DiceStructure(value: 6)
                    .frame(width: dimensions, height: dimensions)
                Rectangle()
                    .frame(width: 2, height: 1)
                    .foregroundStyle(.backSec)
                ValueIndicator(isSpecial: limit > 6, entry: String(results.totalResult[5]))
                    .frame(width: dimensions, height: dimensions)
            }
        }
    }
}
