//
//  UserState.swift
//  CookEZ
//
//  Created by Admin on 4/8/24.
//

import Foundation

class UserState: ObservableObject {
    @Published var loggedInUser: Account?

    func login(account: Account) {
        loggedInUser = account
    }

    func logout() {
        loggedInUser = nil
    }
}
