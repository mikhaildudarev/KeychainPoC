//
//  UserDetailsView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import SwiftUI

struct UserDetailsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: UserDetailsViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Layout
    var body: some View {
        VStack {
            HStack {
                Grid(alignment: .leading) {
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Name").bold()
                        Text(viewModel.model.name ?? "-")
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Surname").bold()
                        Text(viewModel.model.surname ?? "-")
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Patronymic").bold()
                        Text(viewModel.model.patronymic ?? "-")
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Email").bold()
                        Text(viewModel.model.email ?? "-")
                    }
                    GridRow(alignment: .firstTextBaseline) {
                        Text("Phone").bold()
                        Text(viewModel.model.phone ?? "-")
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
