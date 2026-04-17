//
//  Coordinator.swift
//  BattleDice
//
//  Created by Renan Baialuna on 25/03/26.
//

import Foundation
import Combine
import SwiftUI

struct AppCoordinatorView: View {
    @StateObject var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MenuView { route in
                coordinator.navigate(to: route)
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .Menu:
                    MenuView { route in
                        coordinator.navigate(to: route)
                    }

                case .FreeMenu:
                    MenuFreeView{ route in
                        coordinator.navigate(to: route)
                    } onPop: {
                        coordinator.pop()
                    }
                case .NumberHits:
                    NumberOfHitsView{ route in
                        coordinator.navigate(to: route)
                    } onPop: {
                        coordinator.pop()
                    }
                    
                case .HitRoll:
                    RollHitsView{route in
                        coordinator.navigate(to: route)
                    } onPop: {
                        coordinator.pop()
                    }
                    
                    
                    
                default:
                    EmptyView()
                }
            }
        }
    }
}
