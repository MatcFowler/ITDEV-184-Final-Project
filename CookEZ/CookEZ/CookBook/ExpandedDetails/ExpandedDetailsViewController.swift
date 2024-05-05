//
//  ExpandedDetailsViewController.swift
//  CookEZ
//
//  Created by Admin on 4/17/24.
//

import UIKit
import SwiftUI

class ExpandedDetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let scrollView = UIScrollView()
    
    let stackview = UIStackView()

    let headerStackView = UIStackView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    
    let recipeNameTextField = UITextField()
    let addRecipeButton = UIButton()
    let imagesStackView = UIStackView()
    let imageView = UIImageView()
    
    let ingredientsStackView = UIStackView()
    let ingredientsLabel = UILabel()
    let ingredientsTextView = UITextView()
    
    let prepStepsStackView = UIStackView()
    let prepStepsLabel = UILabel()
    let prepStepsTextView = UITextView()
    
    let directionsStackView = UIStackView()
    let directionsLabel = UILabel()
    let directionsTextView = UITextView()
    
    let additionalInformationStackView = UIStackView()
    let additionalInformationLabel = UILabel()
    let additionalInformationTextView = UITextView()
    
    var imageSetter: UIImage = .browniesrecipephoto
    var recipeTitleString: String = "Chicken Stir Fry"
    var ingredientsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var prepStepsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var directionsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var additionalInfoString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
    }
    
}

extension ExpandedDetailsViewController{
    
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
        backButton.backgroundColor = appColorMain
        backButton.addTarget(self, action: #selector(closeCurrentViewController),for: .touchUpInside)
        backButton.layer.cornerRadius = 5
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.appMain.cgColor
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Recipe Viewer"
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textColor = appColorMain
        
        
        recipeNameTextField.translatesAutoresizingMaskIntoConstraints = false
        recipeNameTextField.text = recipeTitleString
        recipeNameTextField.font = .systemFont(ofSize: 20)
        recipeNameTextField.textAlignment = .center
        recipeNameTextField.layer.borderWidth = 2
        recipeNameTextField.layer.borderColor = UIColor.appMain.cgColor
        recipeNameTextField.layer.cornerRadius = 5
        
        addRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        addRecipeButton.setTitle("Add Recipe", for: .normal)
        addRecipeButton.setTitleColor(appColorMain, for: .normal)
        addRecipeButton.addTarget(self, action: #selector(addThisRecipeToUser), for: .touchUpInside)
        addRecipeButton.backgroundColor = appColorMain
        addRecipeButton.setTitleColor(appColorFont, for: .normal)
        
        addRecipeButton.layer.borderWidth = 2
        addRecipeButton.layer.borderColor = UIColor.appMain.cgColor
        addRecipeButton.layer.cornerRadius = 5
        
        imagesStackView.translatesAutoresizingMaskIntoConstraints = false
        imagesStackView.axis = .horizontal
        imagesStackView.layer.borderWidth = 2
        imagesStackView.layer.borderColor = UIColor.appMain.cgColor
        imagesStackView.layer.cornerRadius = 5
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = imageSetter
        
        
        ingredientsStackView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsStackView.axis = .vertical
        ingredientsStackView.layer.borderWidth = 2
        ingredientsStackView.layer.borderColor = UIColor.appMain.cgColor
        
        
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.adjustsFontSizeToFitWidth = true
        ingredientsLabel.textColor = appColorMain
        ingredientsLabel.textAlignment = .center
        ingredientsLabel.layer.borderWidth = 2
        ingredientsLabel.layer.borderColor = UIColor.appMain.cgColor
        
        ingredientsTextView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTextView.text = ingredientsString
        
        prepStepsStackView.translatesAutoresizingMaskIntoConstraints = false
        prepStepsStackView.axis = .vertical
        prepStepsStackView.layer.borderWidth = 2
        prepStepsStackView.layer.borderColor = UIColor.appMain.cgColor
    
        prepStepsLabel.translatesAutoresizingMaskIntoConstraints = false
        prepStepsLabel.text = "Prep-Steps"
        prepStepsLabel.adjustsFontSizeToFitWidth = true
        prepStepsLabel.textColor = appColorMain
        prepStepsLabel.textAlignment = .center
        prepStepsLabel.layer.borderWidth = 2
        prepStepsLabel.layer.borderColor = UIColor.appMain.cgColor
        
        prepStepsTextView.translatesAutoresizingMaskIntoConstraints = false
        prepStepsTextView.text = prepStepsString
        
        
        directionsStackView.translatesAutoresizingMaskIntoConstraints = false
        directionsStackView.axis = .vertical
        directionsStackView.layer.borderWidth = 2
        directionsStackView.layer.borderColor = UIColor.appMain.cgColor
        
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        directionsLabel.text = "Directions"
        directionsLabel.adjustsFontSizeToFitWidth = true
        directionsLabel.textColor = appColorMain
        directionsLabel.textAlignment = .center
        directionsLabel.layer.borderWidth = 2
        directionsLabel.layer.borderColor = UIColor.appMain.cgColor
        
        directionsTextView.translatesAutoresizingMaskIntoConstraints = false
        directionsTextView.text = directionsString
        
        
        additionalInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        additionalInformationStackView.axis = .vertical
        additionalInformationStackView.layer.borderWidth = 2
        additionalInformationStackView.layer.borderColor = UIColor.appMain.cgColor
        
        additionalInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        additionalInformationLabel.text = "Additional Information"
        additionalInformationLabel.adjustsFontSizeToFitWidth = true
        additionalInformationLabel.textColor = appColorMain
        additionalInformationLabel.textAlignment = .center
        additionalInformationLabel.layer.borderWidth = 2
        additionalInformationLabel.layer.borderColor = UIColor.appMain.cgColor
        
        additionalInformationTextView.translatesAutoresizingMaskIntoConstraints = false
        additionalInformationTextView.text = additionalInfoString
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(titleLabel)
        
        ingredientsStackView.addArrangedSubview(ingredientsLabel)
        ingredientsStackView.addArrangedSubview(ingredientsTextView)
        
        prepStepsStackView.addArrangedSubview(prepStepsLabel)
        prepStepsStackView.addArrangedSubview(prepStepsTextView)
        
        imagesStackView.addArrangedSubview(imageView)
        
        directionsStackView.addArrangedSubview(directionsLabel)
        directionsStackView.addArrangedSubview(directionsTextView)
        
        additionalInformationStackView.addArrangedSubview(additionalInformationLabel)
        additionalInformationStackView.addArrangedSubview(additionalInformationTextView)
        
        
        stackview.addArrangedSubview(headerStackView)
        stackview.addArrangedSubview(recipeNameTextField)
        stackview.addArrangedSubview(addRecipeButton)
        stackview.addArrangedSubview(imagesStackView)
        stackview.addArrangedSubview(ingredientsStackView)
        stackview.addArrangedSubview(prepStepsStackView)
        stackview.addArrangedSubview(directionsStackView)
        stackview.addArrangedSubview(additionalInformationStackView)
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(stackview)
        
        NSLayoutConstraint.activate([
            
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackview.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackview.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerStackView.topAnchor.constraint(equalToSystemSpacingBelow: stackview.topAnchor, multiplier: 1),
            headerStackView.trailingAnchor.constraint(equalTo: stackview.trailingAnchor),
            backButton.topAnchor.constraint(equalToSystemSpacingBelow: stackview.topAnchor, multiplier: 1),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 1),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.trailingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 80),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.topAnchor, multiplier: 1),
            titleLabel.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalTo: stackview.centerXAnchor),
            
            recipeNameTextField.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.bottomAnchor, multiplier: 3),
            recipeNameTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 5),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: recipeNameTextField.trailingAnchor, multiplier: 5),
            recipeNameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            addRecipeButton.topAnchor.constraint(equalToSystemSpacingBelow: recipeNameTextField.bottomAnchor, multiplier: 2),
            addRecipeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 13),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: addRecipeButton.trailingAnchor, multiplier: 13),
            
            imagesStackView.topAnchor.constraint(equalToSystemSpacingBelow: addRecipeButton.bottomAnchor, multiplier: 1),
            imagesStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 15),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: imagesStackView.trailingAnchor, multiplier: 15),
            imagesStackView.heightAnchor.constraint(equalToConstant: 100),
            
            imageView.topAnchor.constraint(equalTo: imagesStackView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imagesStackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imagesStackView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imagesStackView.bottomAnchor),
            
            ingredientsStackView.topAnchor.constraint(equalToSystemSpacingBelow: imagesStackView.bottomAnchor, multiplier: 2),
            ingredientsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: ingredientsStackView.trailingAnchor, multiplier: 2),
            ingredientsStackView.heightAnchor.constraint(equalToConstant: 180),
            
        
            prepStepsStackView.topAnchor.constraint(equalToSystemSpacingBelow: ingredientsStackView.bottomAnchor, multiplier: 2),
            prepStepsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: prepStepsStackView.trailingAnchor, multiplier: 2),
            prepStepsStackView.heightAnchor.constraint(equalToConstant: 180),
            
            directionsStackView.topAnchor.constraint(equalToSystemSpacingBelow: prepStepsStackView.bottomAnchor, multiplier: 2),
            directionsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: directionsStackView.trailingAnchor, multiplier: 2),
            directionsStackView.heightAnchor.constraint(equalToConstant: 180),
            
            additionalInformationStackView.topAnchor.constraint(equalToSystemSpacingBelow: directionsStackView.bottomAnchor, multiplier: 2),
            additionalInformationStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 2),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: additionalInformationStackView.trailingAnchor, multiplier: 2),
            additionalInformationStackView.heightAnchor.constraint(equalToConstant: 180),
            
            
            
        ])
    }
    
    
}

extension ExpandedDetailsViewController {
    @objc func closeCurrentViewController() {
            dismiss(animated: true, completion: nil)
        }
    
    @objc func addThisRecipeToUser() {
    
        let recipes = RecipeSetup.loadRecipes()
        print(recipes)
        if let selectedRecipe = recipes.first(where: { $0.name == recipeTitleString }) {
            AccountManager.shared.addRecipeToUser(selectedRecipe, selectedRecipe)
            print(selectedRecipe)
        }else{
            print("Failed to add recipe named: " + recipeTitleString)
        }
    }
}
