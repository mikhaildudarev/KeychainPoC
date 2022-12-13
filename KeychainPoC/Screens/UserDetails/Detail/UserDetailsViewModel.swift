//
//  UserDetailsViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation
import Keychain

final class UserDetailsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var model: User
    private let keychain: KeychainLogic = Keychain.shared
    
    // MARK: - Init/Deinit
    init(model: User) {
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
