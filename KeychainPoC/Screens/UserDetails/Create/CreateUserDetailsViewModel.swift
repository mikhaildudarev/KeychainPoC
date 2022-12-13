//
//  CreateUserDetailsViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Combine
import Foundation
import Keychain

final class CreateUserDetailsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var name: String = "John"
    @Published var surname: String = "Appleseed"
    @Published var patronymic: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var canSave: Bool = false
    
    private let keychain: KeychainLogic = Keychain.shared
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Init/Deinit
    init() {
        bindPublishers()
    }
    
    // MARK: - Internal Methods
    func save(callback: (Bool, Error?) -> Void) {
        let userDetailsModel = User(
            name: name.isEmpty ? nil : name,
            surname: surname.isEmpty ? nil : surname,
            patronymic: patronymic.isEmpty ? nil : patronymic,
            email: email.isEmpty ? nil : email,
            phone: phone.isEmpty ? nil : phone
        )
        let result = keychain.save(userDetailsModel)
        switch result {
        case .success:
            callback(true, nil)
        case .failure(let error):
            callback(false, error)
        }
    }
    
    // MARK: - Private Methods
    private func bindPublishers() {
        $name
            .combineLatest($email) { !$0.isEmpty && !$1.isEmpty }
            .assign(to: &$canSave)
    }
}
