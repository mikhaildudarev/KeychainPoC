//
//  UserDetailsCellView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Keychain
import SwiftUI

struct UserDetailsCellView: View {
    // MARK: - Properties
    @State var model: User
    
    // MARK: - Layout
    var body: some View {
        Grid(alignment: .leading) {
            GridRow(alignment: .firstTextBaseline) {
                Text("Name").bold()
                Text(model.name ?? "-")
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Surname").bold()
                Text(model.surname ?? "-")
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Patronymic").bold()
                Text(model.patronymic ?? "-")
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Email").bold()
                Text(model.email ?? "-")
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Phone").bold()
                Text(model.phone ?? "-")
            }
        }
    }
}
