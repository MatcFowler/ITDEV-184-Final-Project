//
//  CreateAccountView.swift
//  CookEZ
//
//  Created by Admin on 4/8/24.
//

import UIKit
import SwiftUI


struct CreateAccountView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var password = ""

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            
            
            TextField("First Name", text: $firstName)
                .border(.appMain, width: 3)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Last Name", text: $lastName)
                .border(.appMain, width: 3)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Username", text: $username)
                .border(.appMain, width: 3)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .border(.appMain, width: 3)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                if (!firstName.isEmpty && !username.isEmpty && !username.isEmpty && !password.isEmpty){
                    AccountManager.shared.saveAccount(Account(firstname: firstName, lastname: lastName, username: username, password: password, recipes: []))
                    presentationMode.wrappedValue.dismiss()
                    
                }else{
                    print("Save Failed")
                }
            }){
                Text("Create Account")
                    .foregroundColor(Color(appColorFont))
                    .padding(10)
            }
            .background(Color(appColorMain))
            .cornerRadius(5)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .foregroundColor(Color(appColorFont))
                    .padding(10)
            }
            .background(Color(appColorMain))
            .cornerRadius(5)
        }
        .background(Color(appColorForeGround))
        .padding()
        .navigationTitle("Create Account")
        .tint(Color(appColorMain))
    }
}

