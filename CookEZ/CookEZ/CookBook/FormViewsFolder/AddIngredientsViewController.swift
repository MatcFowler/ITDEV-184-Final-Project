//
//  AddIngredientsViewController.swift
//  CookEZ
//
//  Created by Admin on 4/14/24.
//

//
//  DetailsView.swift
//  CookEZ
//
//  Created by Admin on 4/12/24.
//
import UIKit
import SwiftUI

class AddIngredientsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let pickerView1 = UIPickerView()
    let pickerView2 = UIPickerView()
    
    let picker1Label = UILabel()
    let picker2Label = UILabel()

    let dataForPicker1 = ["1/16","1/8","1/4","1/3","1/2","2/3","3/4","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"]
    let dataForPicker2 = [" ","Tbs", "Tsp", "tbsp", "lbs", "cups"]
    
    let stackview = UIStackView()
    
    let ingredientNameTextField = UITextField()

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

extension AddIngredientsViewController{
    
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
        
        pickerView1.translatesAutoresizingMaskIntoConstraints = false
        pickerView1.dataSource = self
        pickerView1.delegate = self
        
        pickerView2.translatesAutoresizingMaskIntoConstraints = false
        pickerView2.dataSource = self
        pickerView2.delegate = self

        picker1Label.translatesAutoresizingMaskIntoConstraints = false
        picker1Label.textAlignment = .center
        picker1Label.font = UIFont.systemFont(ofSize: 20)
        
        picker2Label.translatesAutoresizingMaskIntoConstraints = false
        picker2Label.textAlignment = .center
        picker2Label.font = UIFont.systemFont(ofSize: 20)
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Add ingredients"
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textColor = appColorMain
        
        
        ingredientNameTextField.translatesAutoresizingMaskIntoConstraints = false
        ingredientNameTextField.font = .systemFont(ofSize: 20)
        ingredientNameTextField.placeholder = "Enter Your Ingredient Here"
        ingredientNameTextField.layer.borderWidth = 2
        ingredientNameTextField.layer.borderColor = UIColor.appMain.cgColor
        ingredientNameTextField.layer.cornerRadius = 5
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.layer.cornerRadius = 6
        submitButton.setTitle("Add", for: .normal)
        submitButton.addTarget(self, action: #selector(closeViewController), for: .primaryActionTriggered)
        submitButton.setTitleColor(appColorMain, for: .normal)
        submitButton.backgroundColor = appColorForeGround
        
    }
    
    func layout() {
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(titleLabel)
        
        stackview.addArrangedSubview(headerStackView)
        stackview.addArrangedSubview(picker1Label)
        stackview.addArrangedSubview(pickerView1)
        stackview.addArrangedSubview(picker2Label)
        stackview.addArrangedSubview(pickerView2)
        stackview.addArrangedSubview(ingredientNameTextField)
        stackview.addArrangedSubview(submitButton)
        
        view.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            
            stackview.heightAnchor.constraint(equalToConstant: 500),
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
            
            
            picker1Label.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.bottomAnchor, multiplier: 2),
            picker1Label.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: picker1Label.trailingAnchor, multiplier: 2),
            picker1Label.heightAnchor.constraint(equalToConstant: 40),
            
            
            pickerView1.topAnchor.constraint(equalToSystemSpacingBelow: picker1Label.bottomAnchor, multiplier: 2),
            pickerView1.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: pickerView1.trailingAnchor, multiplier: 2),
            pickerView1.heightAnchor.constraint(equalToConstant: 80),
            
            picker2Label.topAnchor.constraint(equalToSystemSpacingBelow: pickerView1.bottomAnchor, multiplier: 2),
            picker2Label.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: picker2Label.trailingAnchor, multiplier: 2),
            picker2Label.heightAnchor.constraint(equalToConstant: 40),
            
            pickerView2.topAnchor.constraint(equalToSystemSpacingBelow: picker2Label.bottomAnchor, multiplier: 2),
            pickerView2.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: pickerView2.trailingAnchor, multiplier: 2),
            pickerView2.heightAnchor.constraint(equalToConstant: 80),
            
            ingredientNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: pickerView2.bottomAnchor, multiplier: 3),
            ingredientNameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientNameTextField.trailingAnchor, multiplier: 2),
            ingredientNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            submitButton.topAnchor.constraint(equalToSystemSpacingBelow: ingredientNameTextField.bottomAnchor, multiplier: 3),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 12),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 12),
            submitButton.widthAnchor.constraint(equalToConstant: 50),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            stackview.bottomAnchor.constraint(equalToSystemSpacingBelow: submitButton.bottomAnchor, multiplier: 8),
            
            
            
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == pickerView1 {
                return dataForPicker1.count
            } else {
                return dataForPicker2.count
            }
        }


        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == pickerView1 {
                return dataForPicker1[row]
            } else {
                return dataForPicker2[row]
            }
        }

        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == pickerView1 {
                let selectedValue = dataForPicker1[row]
                picker1Label.text = selectedValue
            } else {
                let selectedValue = dataForPicker2[row]
                picker2Label.text = selectedValue
            }
        }
    
    
}   

extension AddIngredientsViewController {
    @objc func closeViewController() {
        let viewController2 = DetailsViewController()
        viewController2.ingredientsString += "\(picker1Label.text ?? "") \(picker2Label.text ?? "") \(ingredientNameTextField.text ?? "")"
        present(viewController2, animated: true)
     
    }
    
    @objc func closeCurrentViewController() {
            dismiss(animated: true, completion: nil)
        }
}


