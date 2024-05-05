//
//  AccountEditorViewController.swift
//  CookEZ
//
//  Created by Admin on 4/20/24.
//

//  Created by Admin on 4/17/24.
//

import UIKit
import SwiftUI

class AccountEditorViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    let stackview = UIStackView()
    
    let titleLabel = UILabel()
    
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let userNameLabel = UILabel()
    let passwordLabel = UILabel()
    
    let firstNameTextField = UITextField()
    let lastNameTextField = UITextField()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    
    let submitButton = UIButton()
    
    var firstNameString: String = ""
    var lastNameString: String = ""
    var userNameString: String = ""
    var passwordString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
}

extension AccountEditorViewController{
    
    func style() {
        
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.tintColor = appColorMain
        stackview.spacing = 10
        stackview.backgroundColor = appColorForeGround
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.text = "Account Editor"
        titleLabel.font = .systemFont(ofSize: 23)
        titleLabel.textColor = appColorMain
        titleLabel.textAlignment = .center
        
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        firstNameLabel.font = .systemFont(ofSize: 16)
        firstNameLabel.text = "First Name"
        firstNameLabel.textColor = appColorMain
        
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.text = firstNameString
        firstNameTextField.textColor = appColorMain
        firstNameTextField.font = .systemFont(ofSize: 24)
        firstNameTextField.textAlignment = .center
        firstNameTextField.layer.borderWidth = 2
        firstNameTextField.layer.borderColor = UIColor.appMain.cgColor
        
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        lastNameLabel.font = .systemFont(ofSize: 16)
        lastNameLabel.text = "Last Name"
        lastNameLabel.textColor = appColorMain
        
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.text = lastNameString
        lastNameTextField.textColor = appColorMain
        lastNameTextField.font = .systemFont(ofSize: 24)
        lastNameTextField.textAlignment = .center
        lastNameTextField.layer.borderWidth = 2
        lastNameTextField.layer.borderColor = UIColor.appMain.cgColor
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        userNameLabel.font = .systemFont(ofSize: 16)
        userNameLabel.text = "Username"
        userNameLabel.textColor = appColorMain
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.text = userNameString
        userNameTextField.textColor = appColorMain
        userNameTextField.font = .systemFont(ofSize: 24)
        userNameTextField.textAlignment = .center
        userNameTextField.layer.borderWidth = 2
        userNameTextField.layer.borderColor = UIColor.appMain.cgColor
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordLabel.text = "Password"
        passwordLabel.textColor = appColorMain
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.text = passwordString
        passwordTextField.font = .systemFont(ofSize: 24)
        passwordTextField.textColor = appColorMain
        passwordTextField.textAlignment = .center
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.appMain.cgColor
        
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("Submit Edit", for: .normal)
        submitButton.setTitleColor(appColorMain, for: .normal)
        submitButton.addTarget(self, action: #selector(submitEdittedAccount), for: .touchUpInside)
        submitButton.backgroundColor = appColorMain
        submitButton.setTitleColor(appColorFont, for: .normal)
        
       
    }
    
    func layout() {
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(firstNameLabel)
        stackview.addArrangedSubview(firstNameTextField)
        stackview.addArrangedSubview(lastNameLabel)
        stackview.addArrangedSubview(lastNameTextField)
        stackview.addArrangedSubview(userNameLabel)
        stackview.addArrangedSubview(userNameTextField)
        stackview.addArrangedSubview(passwordLabel)
        stackview.addArrangedSubview(passwordTextField)
        view.addSubview(stackview)
        view.addSubview(submitButton)
        
        
        NSLayoutConstraint.activate([
            
            
            
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackview.topAnchor, multiplier: 1),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            firstNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            firstNameLabel.bottomAnchor.constraint(equalTo: firstNameTextField.topAnchor),
            firstNameLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            firstNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: firstNameLabel.bottomAnchor, multiplier: 1),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 60),
            lastNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: firstNameTextField.bottomAnchor, multiplier: 3),
            lastNameLabel.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor),
            lastNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: lastNameLabel.bottomAnchor, multiplier: 1),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: lastNameTextField.bottomAnchor, multiplier: 3),
            userNameLabel.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor),
            userNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: userNameLabel.bottomAnchor, multiplier: 1),
            userNameTextField.heightAnchor.constraint(equalToConstant: 60),
            passwordLabel.topAnchor.constraint(equalToSystemSpacingBelow: userNameTextField.bottomAnchor, multiplier: 3),
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor),
            passwordTextField.topAnchor.constraint(equalToSystemSpacingBelow: passwordLabel.bottomAnchor, multiplier: 1),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60),
            submitButton.topAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 50),
            submitButton.widthAnchor.constraint(equalToConstant: 150),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 5),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 5),
        ])
    }
    
    
}

extension AccountEditorViewController {
    @objc func closeCurrentViewController() {
            // Dismiss the presented view controller
            dismiss(animated: true, completion: nil)
        }
    
    @objc func submitEdittedAccount() {
        if (!firstNameString.isEmpty && !lastNameString.isEmpty && !userNameString.isEmpty && !passwordString.isEmpty){
            
            let originalUserString = userNameString
            firstNameString = firstNameTextField.text ?? ""
            lastNameString = lastNameTextField.text ?? ""
            userNameString = userNameTextField.text ?? ""
            passwordString = passwordTextField.text ?? ""
            
            AccountManager.shared.saveEdittedAccount(Account(firstname: firstNameString, lastname: lastNameString, username: userNameString, password: passwordString, recipes: AccountManager.shared.returnUserAccount().recipes), originalUsername: originalUserString)
            print(firstNameString + lastNameString + userNameString + passwordString)
            print("Save Attempted")
            dismiss(animated: true, completion: nil)
            
        }else{
            print("Save Failed")
        }
    }
}
