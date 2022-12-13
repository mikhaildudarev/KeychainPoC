//
//  UserDetailsListView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Keychain
import SwiftUI

struct UserDetailsListView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: UserDetailsListViewModel
    
    // MARK: - Layout
    var body: some View {
        NavigationStack {
            List(viewModel.userDetails) { userModel in
                NavigationLink(
                    value: userModel,
                    label: { UserDetailsCellView(model: userModel) }
                )
            }
            .listStyle(.plain)
            .navigationDestination(for: User.self) {
                UserDetailsView(viewModel: UserDetailsViewModel(model: $0))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear all", action: viewModel.clearAllUserDetails)
                        .foregroundColor(viewModel.userDetails.isEmpty ? .gray : .red)
                        .disabled(viewModel.userDetails.isEmpty)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: { CreateUserDetailsView(viewModel: CreateUserDetailsViewModel()) },
                        label: { Image(systemName: "plus") }
                    )
                }
            }
            .navigationTitle("User Details")
            .navigationBarTitleDisplayMode(.large)
            .onAppear { viewModel.updateUserDetails() }
        }
    }
}
