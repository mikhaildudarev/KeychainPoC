//
//  PasswordView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct PasswordView: View {
    @ObservedObject var viewModel: PasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Host")
                        Text(viewModel.model.host)
                    }
                    GridRow {
                        Text("Login")
                        Text(viewModel.model.login ?? "-")
                    }
                    GridRow {
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
