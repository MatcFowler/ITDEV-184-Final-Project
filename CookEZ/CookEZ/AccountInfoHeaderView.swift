//
//  AccountInfoHeader.swift
//  CookEZ
//
//  Created by Admin on 4/8/24.
//

import SwiftUI

struct AccountInfoHeaderView: View {
    let account: Account

    var body: some View {
        VStack {
            Text("Username: \(account.username)")
            Text("Name: \(account.firstname) \(account.lastname)")
        }
        .navigationTitle("Account Details")
    }
}
