//
//  CreateUserDetailsView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct CreateUserDetailsView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel: CreateUserDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Init/Deinit
    init(viewModel: CreateUserDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Layout
    var body: some View {
        VStack(spacing: 10) {
            TextField("Name", text: $viewModel.name, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.words)
            TextField("Surname", text: $viewModel.surname, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.words)
            TextField("Patronymic", text: $viewModel.patronymic, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.asciiCapable)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.words)
            TextField("Email", text: $viewModel.email, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            TextField("Phone", text: $viewModel.phone, prompt: nil)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.phonePad)
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
    }
}
