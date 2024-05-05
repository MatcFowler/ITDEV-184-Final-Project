//
//  DetailsView.swift
//  CookEZ
//
//  Created by Admin on 4/12/24.
//
import UIKit
import SwiftUI

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let scrollView = UIScrollView()
    
    let stackview = UIStackView()

    let headerStackView = UIStackView()
    let backButton = UIButton()
    let titleLabel = UILabel()
    
    let recipeNameTextField = UITextField()
    let addImagesButton = UIButton()
    let imagesStackView = UIStackView()
    let imageView = UIImageView()
    
    let ingredientsStackView = UIStackView()
    let ingredientsLabel = UILabel()
    let ingredientsTextView = UITextView()
    let ingredientsAddButton = UIButton()
    
    let prepStepsStackView = UIStackView()
    let prepStepsLabel = UILabel()
    let prepStepsTextView = UITextView()
    let prepStepsAddButton = UIButton()
    
    let directionsStackView = UIStackView()
    let directionsLabel = UILabel()
    let directionsTextView = UITextView()
    let directionsAddButton = UIButton()
    
    let additionalInformationStackView = UIStackView()
    let additionalInformationLabel = UILabel()
    let additionalInformationTextView = UITextView()
    let additionalInformationAddButton = UIButton()
    
    let sharedGloballyStackView = UIStackView()
    let sharedGloballyLabel = UILabel()
    let onToggle = UIButton()
    let offToggle = UIButton()
    
    let submitButton = UIButton()
        
    var origRecipe: Recipe = Recipe(name: "", author: "", previewImage: .browniesrecipephoto, ingredients: [""], prepSteps: [""], directions: [""], additionalInformation: [""], globallyShared: true)
    var recipeTitleString: String = "Chicken Stir Fry"
    var ingredientsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var prepStepsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var directionsString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var additionalInfoString: String = "1 Pound Pepper \n2 Spoonfuls Paprika"
    var globalsharing: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        toggleSetup()
        
    }
    
}

extension DetailsViewController{
    
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
        backButton.addTarget(self, action: #selector(closeCurrentViewController),for: .primaryActionTriggered)
        backButton.layer.cornerRadius = 5
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.appMain.cgColor
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Recipe Editor"
        titleLabel.font = .systemFont(ofSize: 28)
        titleLabel.textColor = appColorMain
        
        
        recipeNameTextField.translatesAutoresizingMaskIntoConstraints = false
        recipeNameTextField.text = recipeTitleString
        recipeNameTextField.font = .systemFont(ofSize: 20)
        recipeNameTextField.textAlignment = .center
        recipeNameTextField.layer.borderWidth = 2
        recipeNameTextField.layer.borderColor = UIColor.appMain.cgColor
        recipeNameTextField.layer.cornerRadius = 5
        
        addImagesButton.translatesAutoresizingMaskIntoConstraints = false
        addImagesButton.setTitle("Add images", for: .normal)
        addImagesButton.setTitleColor(appColorMain, for: .normal)
        addImagesButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        addImagesButton.layer.borderWidth = 2
        addImagesButton.layer.borderColor = UIColor.appMain.cgColor
        addImagesButton.layer.cornerRadius = 5
        
        
        imagesStackView.translatesAutoresizingMaskIntoConstraints = false
        imagesStackView.axis = .horizontal
        imagesStackView.layer.borderWidth = 2
        imagesStackView.layer.borderColor = UIColor.appMain.cgColor
        imagesStackView.layer.cornerRadius = 5
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        
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
        
        ingredientsAddButton.translatesAutoresizingMaskIntoConstraints = false
        ingredientsAddButton.setTitle("Add", for: .normal)
        ingredientsAddButton.addTarget(self, action: #selector(goToIngredientsViewController),for: .primaryActionTriggered)
        ingredientsAddButton.setTitleColor(appColorFont, for: .normal)
        ingredientsAddButton.backgroundColor = appColorMain
        
        
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
        
        prepStepsAddButton.translatesAutoresizingMaskIntoConstraints = false
        prepStepsAddButton.setTitle("Add", for: .normal)
        prepStepsAddButton.setTitleColor(appColorFont, for: .normal)
        prepStepsAddButton.addTarget(self, action: #selector(goToPrepStepsViewController),for: .primaryActionTriggered)
        prepStepsAddButton.backgroundColor = appColorMain
        
        
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
        
        directionsAddButton.translatesAutoresizingMaskIntoConstraints = false
        directionsAddButton.setTitle("Add", for: .normal)
        directionsAddButton.setTitleColor(appColorFont, for: .normal)
        directionsAddButton.addTarget(self, action: #selector(goToDirectionsViewController),for: .primaryActionTriggered)
        directionsAddButton.backgroundColor = appColorMain
        
        
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
        
        additionalInformationAddButton.translatesAutoresizingMaskIntoConstraints = false
        additionalInformationAddButton.setTitle("Add", for: .normal)
        additionalInformationAddButton.setTitleColor(appColorFont, for: .normal)
        additionalInformationAddButton.addTarget(self, action: #selector(goToAdditionalInformationViewController),for: .primaryActionTriggered)
        additionalInformationAddButton.backgroundColor = appColorMain
        
        
        sharedGloballyStackView.translatesAutoresizingMaskIntoConstraints = false
        sharedGloballyStackView.axis = .horizontal
        sharedGloballyStackView.layer.borderWidth = 2
        sharedGloballyStackView.layer.borderColor = UIColor.appMain.cgColor
        sharedGloballyStackView.layer.cornerRadius = 5
        
        sharedGloballyLabel.translatesAutoresizingMaskIntoConstraints = false
        sharedGloballyLabel.text = "Globally Shared"
        sharedGloballyLabel.layer.cornerRadius = 5
        sharedGloballyLabel.textAlignment = .center
        sharedGloballyLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        sharedGloballyLabel.textColor = appColorMain
        sharedGloballyLabel.layer.borderWidth = 3
        sharedGloballyLabel.layer.borderColor = UIColor.appMain.cgColor
        
        onToggle.translatesAutoresizingMaskIntoConstraints = false
        onToggle.setTitle("Y",for:[])
        onToggle.layer.backgroundColor = UIColor.appMain.cgColor
        onToggle.layer.cornerRadius = 5
        onToggle.layer.borderWidth = 3
        onToggle.layer.borderColor = UIColor.appMain.cgColor
        onToggle.addTarget(self, action: #selector(onTapped), for: .primaryActionTriggered)
        
        offToggle.translatesAutoresizingMaskIntoConstraints = false
        offToggle.setTitle("N",for:[])
        offToggle.layer.cornerRadius = 5
        offToggle.tintColor = appColorMain
        offToggle.layer.borderWidth = 3
        offToggle.layer.borderColor = UIColor.appMain.cgColor
        offToggle.addTarget(self, action: #selector(offTapped), for: .primaryActionTriggered)
        
        
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.layer.cornerRadius = 5
        submitButton.setTitle("Submit Edit", for: .normal)
        submitButton.setTitleColor(appColorMain, for: .normal)
        submitButton.addTarget(self, action: #selector(submitRecipe), for: .touchUpInside)
        submitButton.backgroundColor = appColorForeGround
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        
        headerStackView.addArrangedSubview(backButton)
        headerStackView.addArrangedSubview(titleLabel)
        
        ingredientsStackView.addArrangedSubview(ingredientsLabel)
        ingredientsStackView.addArrangedSubview(ingredientsTextView)
        ingredientsStackView.addArrangedSubview(ingredientsAddButton)
        
        prepStepsStackView.addArrangedSubview(prepStepsLabel)
        prepStepsStackView.addArrangedSubview(prepStepsTextView)
        prepStepsStackView.addArrangedSubview(prepStepsAddButton)
        
        imagesStackView.addArrangedSubview(imageView)
        
        directionsStackView.addArrangedSubview(directionsLabel)
        directionsStackView.addArrangedSubview(directionsTextView)
        directionsStackView.addArrangedSubview(directionsAddButton)
        
        additionalInformationStackView.addArrangedSubview(additionalInformationLabel)
        additionalInformationStackView.addArrangedSubview(additionalInformationTextView)
        additionalInformationStackView.addArrangedSubview(additionalInformationAddButton)
        
        sharedGloballyStackView.addArrangedSubview(sharedGloballyLabel)
        sharedGloballyStackView.addArrangedSubview(onToggle)
        sharedGloballyStackView.addArrangedSubview(offToggle)
        
        
        stackview.addArrangedSubview(headerStackView)
        stackview.addArrangedSubview(recipeNameTextField)
        stackview.addArrangedSubview(addImagesButton)
        stackview.addArrangedSubview(imagesStackView)
        stackview.addArrangedSubview(ingredientsStackView)
        stackview.addArrangedSubview(prepStepsStackView)
        stackview.addArrangedSubview(directionsStackView)
        stackview.addArrangedSubview(additionalInformationStackView)
        stackview.addArrangedSubview(sharedGloballyStackView)
        stackview.addArrangedSubview(submitButton)
        
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
            
            addImagesButton.topAnchor.constraint(equalToSystemSpacingBelow: recipeNameTextField.bottomAnchor, multiplier: 2),
            addImagesButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 13),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: addImagesButton.trailingAnchor, multiplier: 13),
            
            imagesStackView.topAnchor.constraint(equalToSystemSpacingBelow: addImagesButton.bottomAnchor, multiplier: 1),
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
            
            sharedGloballyStackView.topAnchor.constraint(equalToSystemSpacingBelow: additionalInformationStackView.bottomAnchor, multiplier: 2),
            sharedGloballyStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 5),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: sharedGloballyStackView.trailingAnchor, multiplier: 5),
            sharedGloballyLabel.leadingAnchor.constraint(equalTo: sharedGloballyStackView.leadingAnchor),
            sharedGloballyLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: sharedGloballyStackView.leadingAnchor, multiplier: 2),
            onToggle.trailingAnchor.constraint(equalToSystemSpacingAfter: sharedGloballyLabel.trailingAnchor, multiplier: 4),
            sharedGloballyLabel.heightAnchor.constraint(equalToConstant: 35),
            onToggle.widthAnchor.constraint(equalToConstant: 35),
            offToggle.widthAnchor.constraint(equalToConstant: 35),
            
            submitButton.topAnchor.constraint(equalToSystemSpacingBelow: sharedGloballyStackView.bottomAnchor, multiplier: 2),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackview.leadingAnchor, multiplier: 12),
            stackview.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 12),
            submitButton.widthAnchor.constraint(equalToConstant: 50),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
        ])
    }
    
    func toggleSetup(){
        if globalsharing == true{
            onToggle.layer.backgroundColor = UIColor.appMain.cgColor
            offToggle.layer.backgroundColor = UIColor.appForeground.cgColor
            offToggle.layer.borderColor = UIColor.appMain.cgColor
        }else{
            offToggle.layer.backgroundColor = UIColor.appNegatory.cgColor
            offToggle.layer.borderColor = UIColor.appNegatory.cgColor
            onToggle.layer.backgroundColor = UIColor.appForeground.cgColor
        }
    }
    
    
}

extension DetailsViewController {
    @objc func goToIngredientsViewController() {
        let viewController0 = AddIngredientsViewController()
        present(viewController0, animated: true, completion: nil)
    }
    @objc func goToPrepStepsViewController() {
        let viewController1 = AddPrepStepsViewController()
        present(viewController1, animated: true, completion: nil)
    }
    @objc func goToDirectionsViewController() {
        let viewController2 = AddDirectionsViewController()
        present(viewController2, animated: true, completion: nil)
    }
    @objc func goToAdditionalInformationViewController() {
        let viewController3 = AddAdditionalInformationViewController()
        present(viewController3, animated: true, completion: nil)
    }
    @objc func submitRecipe() {
        let recipe = Recipe(
            name: recipeNameTextField.text ?? "",
            author: AccountManager.shared.username ?? "",
            previewImage: imageView.image ?? UIImage(resource: .browniesrecipephoto),
            ingredients: [ingredientsString],
            prepSteps: [prepStepsString],
            directions: [directionsString],
            additionalInformation: [additionalInfoString],
            globallyShared: globalsharing)
        
        let originalRecipe = Recipe(name: recipeTitleString, author: AccountManager.shared.returnUserAccount().username, previewImage: imageView.image ?? UIImage(resource: .kingPiece), ingredients: [ingredientsString], prepSteps: [prepStepsString], directions: [directionsString], additionalInformation: [additionalInfoString], globallyShared: origRecipe.globallyShared)
        
        AccountManager.shared.addRecipeToUser(recipe, originalRecipe)
        
        dismiss(animated: true, completion: nil)
    }
    @objc func closeCurrentViewController() {
            dismiss(animated: true, completion: nil)
        }
}

extension DetailsViewController {
    @objc func selectImage() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                imageView.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        @objc func onTapped(sender : UIButton) {
            
            onToggle.layer.backgroundColor = UIColor.appMain.cgColor
            offToggle.layer.backgroundColor = UIColor.appForeground.cgColor
            offToggle.layer.borderColor = UIColor.appMain.cgColor
            globalsharing = true
        }
        @objc func offTapped(sender : UIButton) {
            
            offToggle.layer.backgroundColor = UIColor.appNegatory.cgColor
            offToggle.layer.borderColor = UIColor.appNegatory.cgColor
            onToggle.layer.backgroundColor = UIColor.appForeground.cgColor
            globalsharing = false
        }
    }

