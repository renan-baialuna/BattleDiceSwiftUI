//
//  Order.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

protocol OrderProtocol {
    var previewsOrders: [OrderProtocol] { get  }
    var phase: [PhasesEnum] { get }
    var priority: Int { get }
    func execute(set: DiceSet?) -> DiceSet
}
