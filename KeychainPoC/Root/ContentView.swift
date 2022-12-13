//
//  ContentView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var selection: Screen = .password
    @ObservedObject var viewModel: ContentViewModel
    @EnvironmentObject private var launchScreenStateManager: LaunchScreenStateManager
    
    // MARK: - Layout
    var body: some View {
        TabView(selection: $selection) {
            PasswordsListView(viewModel: viewModel.passwordsListViewModel)
                .tag(Screen.password)
                .tabItem {
                    Label("Passwords", systemImage: "triangle")
                }
            UserDetailsListView(viewModel: viewModel.userDetailsListViewModel)
                .tag(Screen.userDetails)
                .tabItem {
                    Label("User Details", systemImage: "circle")
                }
            Text("Hello, world!")
                .tag(Screen.address)
                .tabItem {
                    Label("Addresses", systemImage: "cross")
                }
            Text("Hello, world!")
                .tag(Screen.card)
                .tabItem {
                    Label("Cards", systemImage: "square")
                }
        }
        .task { launchScreenStateManager.dismiss() }
    }
}
