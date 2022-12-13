//
//  PasswordViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation
import Keychain

final class PasswordViewModel: ObservableObject {
    // MARK: - Properties
    @Published var model: Password
    private let keychain: KeychainLogic
    
    // MARK: - Init/Deinit
    init(model: Password) {
        keychain = Keychain.shared
        self.model = model
    }
    
    // MARK: - Internal Methods
    func delete(callback: (Bool, Error?) -> Void) {
        let result = keychain.delete(model)
        switch result {
        case .success(let deleted):
            callback(deleted, nil)
        case .failure(let error):
            callback(false, error)
        }
    }
}
