//
//  NavigationSetupModifier.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 16/4/25.
//

import SwiftUI

struct NavigationSetupModifier<CoordinatorType: Coordinator>: ViewModifier {
    @ObservedObject var coordinator: CoordinatorType

    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: CoordinatorType.CoordinatorSteps.self) { step in
                    debugPrint("navigate to: \(step)")
                    return coordinator.redirect(step)
                }
        }
    }
}

extension View {
    func applyNavigation<CoordinatorType: Coordinator>(coordinator: CoordinatorType) -> some View {
        self.modifier(NavigationSetupModifier(coordinator: coordinator))
    }
}
