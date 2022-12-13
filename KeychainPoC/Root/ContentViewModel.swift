//
//  ContentViewModel.swift
//  KeychainPoC
//
//  Created by Mikhail Dudarev on 13.12.2022.
//

import Foundation

final class ContentViewModel: ObservableObject {
    // MARK: - Properties
    let passwordsListViewModel = PasswordsListViewModel()
    let userDetailsListViewModel = UserDetailsListViewModel()
}
