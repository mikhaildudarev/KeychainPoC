//
//  PasswordsListView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Keychain
import SwiftUI

struct PasswordsListView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: PasswordsListViewModel
    
    // MARK: - Init/Deinit
    init(viewModel: PasswordsListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Layout
    var body: some View {
        NavigationStack {
            List(viewModel.passwords) { passwordModel in
                NavigationLink(
                    value: passwordModel,
                    label: { PasswordCellView(model: passwordModel) }
                )
            }
            .listStyle(.plain)
            .navigationDestination(for: Password.self) {
                PasswordView(viewModel: PasswordViewModel(model: $0))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Clear all", action: viewModel.clearAllPasswords)
                        .foregroundColor(viewModel.passwords.isEmpty ? .gray : .red)
                        .disabled(viewModel.passwords.isEmpty)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: { CreatePasswordView(viewModel: CreatePasswordViewModel()) },
                        label: { Image(systemName: "plus") }
                    )
                }
            }
            .navigationTitle("Passwords")
            .navigationBarTitleDisplayMode(.large)
            .onAppear { viewModel.updatePasswords() }
        }
    }
}
