//
//  PasswordsListViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation
import Keychain
import SwiftUI

final class PasswordsListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var passwords: [Password] = []
    private let keychain: KeychainLogic = Keychain.shared
    
    // MARK: - Internal Methods
    func updatePasswords() {
        let result: Result<[Password], Error> = keychain.getAll()
        if case .success(let passwords) = result {
            withAnimation { self.passwords = passwords }
        }
    }
    
    func clearAllPasswords() {
        let result: Result<Void, Error> = keychain.deleteAll(of: Password.self)
        switch result {
        case .success:
            updatePasswords()
        case .failure:
            return // todo: show alert
        }
    }
}
