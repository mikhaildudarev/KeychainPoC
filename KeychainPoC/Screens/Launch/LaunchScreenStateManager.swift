//
//  LaunchScreenStateManager.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
    @MainActor @Published private(set) var state: LaunchScreenStep = .inital
        
    @MainActor func dismiss() {
        Task {
            state = .firstStep
            try? await Task.sleep(for: Duration.seconds(1))
            state = .secondStep
            try? await Task.sleep(for: Duration.seconds(1))
            state = .thirdStep
            try? await Task.sleep(for: Duration.seconds(1.5))
            self.state = .finished
        }
    }
}
