//
//  KeychainPoCApp.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

@main
struct KeychainPoCApp: App {
    // MARK: - Properties
    @StateObject var launchScreenStateManager = LaunchScreenStateManager()
    
    // MARK: - Layout
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView(viewModel: ContentViewModel())
                if launchScreenStateManager.state != .finished {
                    LaunchScreenView()
                }
            }
            .environmentObject(launchScreenStateManager)
        }
    }
}
