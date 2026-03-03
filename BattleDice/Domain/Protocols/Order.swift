//
//  Order.swift
//  BattleDice
//
//  Created by Renan Baialuna on 02/03/26.
//

protocol OrderProtocol {
    var set: RollSet { get  }
    var previewsOrders: [OrderProtocol] { get  }
    func execute(set: RollSet)
}
