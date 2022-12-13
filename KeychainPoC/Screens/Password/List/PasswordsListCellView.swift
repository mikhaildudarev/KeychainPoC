//
//  PasswordsListCellView.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Keychain
import SwiftUI

struct PasswordCellView: View {
    // MARK: - Properties
    @State var model: Password
    
    // MARK: - Layout
    var body: some View {
        Grid(alignment: .leading) {
            GridRow(alignment: .firstTextBaseline) {
                Text("Host").bold()
                Text(model.host)
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Login").bold()
                Text(model.login ?? "-")
            }
            GridRow(alignment: .firstTextBaseline) {
                Text("Password").bold()
                Text(model.value)
            }
        }
    }
}
