//
//  AccountManager.swift
////  CookEZ
////
////  Created by Admin on 4/10/24.
////

import Foundation
import UIKit
import SwiftUI

class AccountManager {
    static let shared = AccountManager()
    let cookbook = CookBookViewController()
    var accounts = AccountsSetup.loadAccounts()
    var recipes = RecipeSetup.loadRecipes()

    private let userDefaults = UserDefaults.standard
    private let usernameKey = "Username"

    var isLoggedIn: Bool {
        return userDefaults.bool(forKey: "isLoggedIn")
    }

    var username: String? {
        return userDefaults.string(forKey: usernameKey)
    }

    func login(username: String) {
        userDefaults.set(true, forKey: "isLoggedIn")
        userDefaults.set(username, forKey: usernameKey)
    }

    func logout() {
        userDefaults.set(false, forKey: "isLoggedIn")
        userDefaults.removeObject(forKey: usernameKey)
    }
    
    func saveAccount(_ newAcocunt: Account) {
        if accounts.first(where: { $0.username == newAcocunt.username }) != nil {
            print("Save Failed due to conflicting Usernames")
        }else{
            accounts.append(newAcocunt)
            print(accounts)
        }
    }
    func saveEdittedAccount(_ edittedAccount: Account, originalUsername: String) {
        if let userAccountIndex = accounts.firstIndex(where: { $0.username == originalUsername}) {
            accounts.insert(edittedAccount, at: userAccountIndex)
            print("Editted Account Successfully Added")
        }else{
            
            print("Save Failed due to conflicting Usernames")
        }
    }
    
    
    func returnAllAccounts() -> [Account]{
        return accounts
    }
    
    func returnUserAccount() -> Account{
        if let userAccount = accounts.first(where: { $0.username == username }) {
            return userAccount
        }else
        {
            print("Failed to Load Account")
            return accounts.first!
        }
        
    }
    
    func addRecipeToUser(_ recipeToAdd: Recipe, _ originalRecipe: Recipe){
        if let userAccountIndex = accounts.firstIndex(where: { $0.username == username }) {
            if let recipeIndex = accounts[userAccountIndex].recipes.firstIndex(where: { $0.name == originalRecipe.name}){
                print("previously made recipe detected")
                accounts[userAccountIndex].recipes[recipeIndex].name.removeAll()
                accounts[userAccountIndex].recipes[recipeIndex].name.append(recipeToAdd.name)
                accounts[userAccountIndex].recipes[recipeIndex].previewImage = recipeToAdd.previewImage
                accounts[userAccountIndex].recipes[recipeIndex].additionalInformation.removeAll()
                accounts[userAccountIndex].recipes[recipeIndex].additionalInformation.append(contentsOf: recipeToAdd.additionalInformation)
                accounts[userAccountIndex].recipes[recipeIndex].directions.removeAll()
                accounts[userAccountIndex].recipes[recipeIndex].directions.append(contentsOf: recipeToAdd.directions)
                accounts[userAccountIndex].recipes[recipeIndex].ingredients.removeAll()
                accounts[userAccountIndex].recipes[recipeIndex].ingredients.append(contentsOf: recipeToAdd.ingredients)
                accounts[userAccountIndex].recipes[recipeIndex].prepSteps.removeAll()
                accounts[userAccountIndex].recipes[recipeIndex].prepSteps.append(contentsOf: recipeToAdd.prepSteps)
                if(recipeToAdd.globallyShared){
                    RecipeSetup.shared.addRecipe(recipeToAdd)
                    print("Attempt to save Globally")
                }
                if(recipeToAdd.globallyShared == originalRecipe.globallyShared){}else{
                    accounts[userAccountIndex].recipes[recipeIndex].globallyShared.toggle()
                }
                
                
            }else{
                accounts[userAccountIndex].recipes.append(recipeToAdd)
                print("New Recipe Successfully Added")
            }
            
        }else{
            print("Failed to save recipe to user account")
        }
    }
    
    func removeRecipeToUser(recipeToRemoveIndex: Int){
        if let userAccountIndex = accounts.firstIndex(where: { $0.username == username }) {
                accounts[userAccountIndex].recipes.remove(at: recipeToRemoveIndex)
                print("Recipe Successfully REmoved")
        }else{
            print("Failed to load user account")
        }
    }
}
