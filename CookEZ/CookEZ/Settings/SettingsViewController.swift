//
//  SettingsViewController.swift
//  CookEZ
//
//  Created by Admin on 3/25/24.
//

import UIKit

protocol LogoutDelegate:AnyObject {
    func didLogout()
}

class SettingsViewController: UIViewController{
    let stackview = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton()
    
    let settingsRowStack = UIStackView()
    let settingsTextLabel = UILabel()
    let settingsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        style()
        layout()
    }   
}

extension SettingsViewController{
    func style(){
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.spacing = 20
        stackview.backgroundColor = appColorForeGround
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Settings"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = appColorMain
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
        logoutButton.backgroundColor = appColorMain
        logoutButton.layer.cornerRadius = 10
        
        settingsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        settingsTextLabel.text = "Edit Account"
        settingsTextLabel.layer.cornerRadius = 8
        settingsTextLabel.textAlignment = .center
        settingsTextLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        settingsTextLabel.textColor = appColorMain
        settingsTextLabel.layer.borderWidth = 3
        settingsTextLabel.layer.borderColor = UIColor.appMain.cgColor
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.setTitle("Edit", for: [])
        settingsButton.addTarget(self, action: #selector(editAcocunt), for: .primaryActionTriggered)
        settingsButton.backgroundColor = appColorMain
        settingsButton.layer.cornerRadius = 10
        
        settingsRowStack.translatesAutoresizingMaskIntoConstraints = false
        settingsRowStack.axis = .horizontal
        settingsRowStack.spacing = 20
        settingsRowStack.backgroundColor = appColorForeGround
        
        
        
    }
    func layout(){
        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(logoutButton)
        
        settingsRowStack.addArrangedSubview(settingsTextLabel)
        settingsRowStack.addArrangedSubview(settingsButton)
        
        view.addSubview(stackview)
        view.addSubview(settingsRowStack)
        
        NSLayoutConstraint.activate([stackview.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 7),
                                     stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     label.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
                                     view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: logoutButton.trailingAnchor, multiplier: 2),
                                     logoutButton.widthAnchor.constraint(equalToConstant: 100),
                                     settingsRowStack.topAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 5),
                                     settingsRowStack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
                                     view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: settingsRowStack.trailingAnchor, multiplier: 2),
                                     settingsTextLabel.leadingAnchor.constraint(equalTo: settingsRowStack.leadingAnchor),
                                     settingsTextLabel.widthAnchor.constraint(equalToConstant: 200),
                                     settingsTextLabel.heightAnchor.constraint(equalToConstant: 40),
                                     settingsButton.widthAnchor.constraint(equalToConstant: 80),
                                    ])
    }
}

extension SettingsViewController {
    
    @objc func logoutTapped(sender : UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
        AccountManager.shared.logout()
    }
    
    @objc func editAcocunt(sender : UIButton) {
        let viewController2 = AccountEditorViewController()
        
        viewController2.firstNameString = AccountManager.shared.returnUserAccount().firstname
        viewController2.lastNameString = AccountManager.shared.returnUserAccount().lastname
        viewController2.userNameString = AccountManager.shared.returnUserAccount().username
        viewController2.passwordString = AccountManager.shared.returnUserAccount().password
        present(viewController2, animated: true, completion: nil)
        
    }
}
