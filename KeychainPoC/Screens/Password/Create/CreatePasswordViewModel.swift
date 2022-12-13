//
//  CreatePasswordViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Combine
import Foundation
import Keychain

final class CreatePasswordViewModel: ObservableObject {
    // MARK: - Properties
    @Published var host: String = "https://ya.ru"
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var canSave: Bool = false
    
    private let keychain: KeychainLogic
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Init/Deinit
    init() {
        self.keychain = Keychain.shared
        bindPublishers()
    }
    
    // MARK: - Internal Methods
    func save(callback: (Bool, Error?) -> Void) {
        let login = login.isEmpty ? nil : login
        let passwordModel = Password(host: host, login: login, value: password)
        let result = keychain.save(passwordModel)
        switch result {
        case .success:
            callback(true, nil)
        case .failure(let error):
            callback(false, error)
        }
    }
    
    // MARK: - Private Methods
    private func bindPublishers() {
        $host
            .map { URL(string: $0)?.host ?? "" }
            .combineLatest($password) { !$0.isEmpty && !$1.isEmpty }
            .assign(to: &$canSave)
    }
}
