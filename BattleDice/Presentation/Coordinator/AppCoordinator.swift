//
//  AppCoordinator.swift
//  BattleDice
//
//  Created by Renan Baialuna on 07/04/26.
//

import Combine
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to route: AppRoute) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}
