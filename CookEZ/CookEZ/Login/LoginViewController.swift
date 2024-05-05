//
//  LoginViewController.swift
//  CookEZ
//
//  Created by Admin on 3/25/24.
//

import UIKit
import SwiftUI

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController{
    let stackview = UIStackView()
    let loginView = LoginView()
    let loginLabel = UILabel()
    let errorMessageLabel = UILabel()
    let createAccountButton = UIButton()
    let signInButton = UIButton()
    
    var accounts: [Account] = AccountsSetup.loadAccounts()
    
    var topEdgeOnScreen: CGFloat = 16
    var topEdgeOffscreen: CGFloat = -1000
    
    var titleTopAnchor: NSLayoutConstraint?
    var createButtonTopAnchor: NSLayoutConstraint?
    var signInButtonTopAnchor: NSLayoutConstraint?
    
    var username: String? {
        return loginView.userTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    weak var delegate:LoginViewControllerDelegate?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension LoginViewController{
    func style(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.backgroundColor = appColorForeGround
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.text = "Login"
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        loginLabel.textColor = appColorMain
        
        createAccountButton.translatesAutoresizingMaskIntoConstraints = false
        createAccountButton.setTitle("Create Account", for: [])
        createAccountButton.addTarget(self, action: #selector(createAccountTapped), for: .primaryActionTriggered)
        createAccountButton.backgroundColor = appColorMain
        createAccountButton.layer.cornerRadius = 5
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        signInButton.backgroundColor = appColorMain
        signInButton.layer.cornerRadius = 5
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    func layout(){
        stackview.addArrangedSubview(loginLabel)
        stackview.addArrangedSubview(loginView)
        stackview.addArrangedSubview(createAccountButton)
        stackview.addArrangedSubview(signInButton)
        stackview.addArrangedSubview(errorMessageLabel)
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 3),
                                    ])
        titleTopAnchor = loginLabel.topAnchor.constraint(equalTo: stackview.topAnchor,constant: topEdgeOffscreen)
        titleTopAnchor?.isActive = true
        
        createButtonTopAnchor = createAccountButton.topAnchor.constraint(equalTo: loginView.bottomAnchor ,constant: topEdgeOffscreen)
        createButtonTopAnchor?.isActive = true
    }
}

extension LoginViewController {
    
    @objc func createAccountTapped (sender:UIButton){
        let createAccountView = UIHostingController(rootView: CreateAccountView())
        createAccountView.modalPresentationStyle = .fullScreen
        createAccountView.view.backgroundColor = appColorForeGround
        present(createAccountView, animated: true, completion: nil)
        
    }
    
    @objc func signInTapped (sender:UIButton){
        
        errorMessageLabel.isHidden = true
        
        login()
    }
    
    private func login(){
        
        guard let username = loginView.userTextField.text, let password = loginView.passwordTextField.text else {
                   return
               }
                accounts = AccountManager.shared.returnAllAccounts()
               // Validate username and password
               if let account = accounts.first(where: { $0.username == username && $0.password == password }) {
                   // If match found, set loggedInUser and navigate to next screen
                   AccountManager.shared.login(username: account.username)
                   LocalState.hasSignedIn = true
                   delegate?.didLogin()
               } else {
                   // If no match found, display error message
                   configureView(withMessage: "Invalid Account Information")
               }
        
        
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
    private func animate(){
        
        let duration = 0.8
        
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeOut){
            self.titleTopAnchor?.constant = self.topEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeOut){
            self.createButtonTopAnchor?.constant = self.topEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.4)
        
        let animator3 = UIViewPropertyAnimator(duration: duration, curve: .easeOut){
            self.signInButtonTopAnchor?.constant = self.topEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 0.4)
        
        let animator4 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeOut){
            self.loginLabel.alpha = 1
            self.createAccountButton.alpha = 1
            self.signInButton.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator4.startAnimation(afterDelay: 0.4)
        
    }
}


