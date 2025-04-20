//
//  Coordinator.swift
//  RickMortyCoordinator
//
//  Created by Edgar Guitian Rey on 15/4/25.
//

import SwiftUI

@MainActor
protocol Coordinator: ObservableObject {
    associatedtype CoordinatorSteps: Steps
    associatedtype CoordinatorView: View

    var path: [CoordinatorSteps] { get set }
    func redirect(_ path: CoordinatorSteps) -> CoordinatorView
}
