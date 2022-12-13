//
//  CreatePasswordView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct CreatePasswordView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: CreatePasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Init/Deinit
    init(viewModel: CreatePasswordViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Layout
    var body: some View {
        VStack(spacing: 10) {
            TextField("Host", text: $viewModel.host, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.URL)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            TextField("Login", text: $viewModel.login, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            TextField("Password", text: $viewModel.password, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(
                    action: {
                        viewModel.save { saved, error in
                            guard saved, error == nil else { return } // todo: alert
                            dismiss()
                        }
                    },
                    label: { Text("Save") }
                )
                .disabled(!viewModel.canSave)
            }
        })
        .padding()
        .onChange(of: viewModel.shouldDismiss) {
            guard $0 else { return }
            dismiss()
        }
    }
}
