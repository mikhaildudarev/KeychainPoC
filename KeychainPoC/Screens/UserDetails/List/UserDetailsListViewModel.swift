//
//  UserDetailsListViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation
import Keychain
import SwiftUI

final class UserDetailsListViewModel: ObservableObject {
    // MARK: - Properties
    @Published var userDetails: [User] = []
    private let keychain: KeychainLogic = Keychain.shared
    
    // MARK: - Internal Methods
    func updateUserDetails() {
        let result: Result<[User], Error> = keychain.getAll()
        if case .success(let users) = result {
            withAnimation { self.userDetails = users }
        }
    }
    
    func clearAllUserDetails() {
        let result: Result<Void, Error> = keychain.deleteAll(of: User.self)
        switch result {
        case .success:
            updateUserDetails()
        case .failure:
            return // todo: show alert
        }
    }
}
