//
//  PasswordView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct PasswordView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: PasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Layout
    var body: some View {
        VStack {
            HStack {
                Grid(alignment: .leading) {
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Host")
                        Text(viewModel.model.host)
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Login")
                        Text(viewModel.model.login ?? "-")
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Password")
                        Text(viewModel.model.value)
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(
                    action: {
                        viewModel.delete { deleted, error in
                            guard deleted, error == nil else { return } // todo: show alert
                            dismiss()
                        }
                    },
                    label: { Image(systemName: "trash").foregroundColor(.red) }
                )
            }
        }
    }
}
