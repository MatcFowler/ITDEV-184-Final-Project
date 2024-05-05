//
//  AddDirectionsViewController.swift
//  CookEZ
//
//  Created by Admin on 4/14/24.
//


import UIKit
import SwiftUI

class AddDirectionsViewController: UIViewController{
    
    
    let stackview = UIStackView()
    
    let directionsTextField = UITextField()

    let headerStackView = UIStackView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    
    let submitButton = UIButton()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
}

extension AddDirectionsViewController{
    
    func style() {
        
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.tintColor = appColorMain
        stackview.spacing = 10
        stackview.backgroundColor = appColorForeGround
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.axis = .horizontal
        headerStackView.backgroundColor = appColorForeGround
        headerStackView.spacing = 5
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(closeCurrentViewController), for: .primaryActionTriggered)
        backButton.backgroundColor = appColorMain
        backButton.layer.cornerRadius = 5
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.appMain.cgColor
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Add ingredients"
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textColor = appColorMain
        
        directionsTextField.translatesAutoresizingMaskIntoConstraints = false
        directionsTextField.font = .systemFont(ofSize: 20)
        directionsTextField.placeholder = "Enter Your Ingredient Here"
        directionsTextField.layer.borderWidth = 2
        directionsTextField.layer.borderColor = UIColor.appMain.cgColor
        directionsTextField.layer.cornerRadius = 5
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.layer.cornerRadius = 5
        submitButton.setTitle("Add", for: .normal)
        submitButton.addTarget(self, action: #selector(closeViewController), for: .primaryActionTriggered)
        submitButton.setTitleColor(appColorMain, for: .normal)
        submitButton.backgroundColor = appColorForeGround
        
    }
    
    func layout() {
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(titleLabel)
        
        stackview.addArrangedSubview(headerStackView)
        stackview.addArrangedSubview(directionsTextField)
        stackview.addArrangedSubview(submitButton)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            
            stackview.heightAnchor.constraint(equalToConstant: 400),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 4),
            stackview.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            headerStackView.topAnchor.constraint(equalToSystemSpacingBelow: stackview.topAnchor, multiplier: 1),
            headerStackView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            headerStackView.heightAnchor.constraint(equalToConstant: 40),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 1),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.trailingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 80),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),

            directionsTextField.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.bottomAnchor, multiplier: 3),
            directionsTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: directionsTextField.trailingAnchor, multiplier: 2),
            directionsTextField.heightAnchor.constraint(equalToConstant: 50),
            
            submitButton.topAnchor.constraint(equalToSystemSpacingBelow: directionsTextField.bottomAnchor, multiplier: 3),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 12),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 12),
            submitButton.widthAnchor.constraint(equalToConstant: 50),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            stackview.bottomAnchor.constraint(equalToSystemSpacingBelow: submitButton.bottomAnchor, multiplier: 8),
            
            
            
        ])
    }
    
}

extension AddDirectionsViewController {
    @objc func closeViewController() {
        let viewController2 = DetailsViewController()
        viewController2.directionsString += (directionsTextField.text ?? "")
        present(viewController2, animated: true)
     
    }
    
    @objc func closeCurrentViewController() {
            // Dismiss the presented view controller
            dismiss(animated: true, completion: nil)
        }
}


