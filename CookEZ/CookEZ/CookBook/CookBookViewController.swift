//
//  CookBookMainViewController.swift
//  CookEZ
//
//  Created by Admin on 3/25/24.
//

import UIKit
import SwiftUI

class CookBookViewController: UIViewController{
    
    let stackview = UIStackView()
    let label = UILabel()
    let refreshButton = UIImageView()
    let addButton = UIImageView()
    let button = UIButton()
    let button2 = UIButton()
    
    
    var usernameString: String = ""
    var userAccount: Account = Account(firstname: "", lastname: "", username: "", password: "", recipes: [])
    
    var headerView = CookBookHeaderView(frame: .zero)
    
    let recipeSetup = RecipeSetup()
    
    var recipes: [Recipe] = []
    
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchData()
        style()
        layout()
        }
    
    }




extension CookBookViewController{
    func setup(){
        let updateTap = UITapGestureRecognizer(target: self, action: #selector(updateData(_: )))
        refreshButton.addGestureRecognizer(updateTap)
        refreshButton.isUserInteractionEnabled = true
        
        let addTap = UITapGestureRecognizer(target: self, action: #selector(addRecipe(_: )))
        addButton.addGestureRecognizer(addTap)
        addButton.isUserInteractionEnabled = true
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(CookBookViewController.longPress(longPressGestureRecognizer:)))
        tableView.addGestureRecognizer(longPressRecognizer)
    }
    func style(){
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .horizontal
        stackview.backgroundColor = appColorForeGround
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = appColorFont
        tableView.layer.borderWidth = CGFloat(1)
        tableView.layer.borderColor = appColorMain.cgColor
        tableView.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        tableView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.reuseID)
        tableView.rowHeight = RecipeCell.rowHeight
        tableView.showsVerticalScrollIndicator = true
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = userAccount.firstname
        label.textColor = appColorMain
        label.textAlignment = .center
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.image = UIImage(systemName: "arrow.2.circlepath")
        refreshButton.tintColor = appColorMain
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.image = UIImage(systemName: "plus.circle")
        addButton.tintColor = appColorMain
        
    }
    func layout(){
        view.addSubview(headerView)
        stackview.addArrangedSubview(addButton)
        stackview.addArrangedSubview(refreshButton)
        view.addSubview(label)
        view.addSubview(stackview)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: -52),
            
            label.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 0),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: label.bottomAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 3),
            stackview.heightAnchor.constraint(equalToConstant: 40),addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            view.trailingAnchor.constraint(equalTo: refreshButton.leadingAnchor, constant: 80),
            
            tableView.topAnchor.constraint(equalTo: stackview.bottomAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CookBookViewController {
    func goToDetailsViewController(_ recipe: Recipe) {
        let viewController2 = DetailsViewController()
        viewController2.origRecipe = recipe
        viewController2.recipeTitleString = recipe.name
        viewController2.imageView.image = recipe.previewImage
        viewController2.ingredientsString = recipeSetup.arrayToStringWithBreaks(recipe.ingredients)
        viewController2.prepStepsString = recipeSetup.arrayToStringWithBreaks(recipe.prepSteps)
        viewController2.directionsString = recipeSetup.arrayToStringWithBreaks(recipe.directions)
        viewController2.additionalInfoString = recipeSetup.arrayToStringWithBreaks(recipe.additionalInformation)
        viewController2.globalsharing = recipe.globallyShared
        present(viewController2, animated: true, completion: nil)
    }
}

extension CookBookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !userAccount.recipes.isEmpty else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseID, for: indexPath) as! RecipeCell
        let recipe = userAccount.recipes[indexPath.row]
        cell.configure(with: recipe)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAccount.recipes.count
    }
}

extension CookBookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedRecipe = userAccount.recipes[indexPath.row]
        print("Selected recipe: \(selectedRecipe.name)")
        goToDetailsViewController(selectedRecipe)
    }
    
}

extension CookBookViewController {
     func fetchData(){
        
            if let username = AccountManager.shared.username {
               usernameString = username
               print(usernameString)
               userAccount = AccountManager.shared.returnUserAccount()
                print(userAccount.recipes)
            }else{
                print("Failed to fectch appropriate profile data")
            }
         
    }
    
    @objc func updateData(_ recognizer: UITapGestureRecognizer){
        fetchData()
        updateTable()
        label.text = userAccount.firstname
        print("Update Attempted" + userAccount.username)
        refreshControl.endRefreshing()

    }
    
    @objc func addRecipe(_ recognizer: UITapGestureRecognizer) {
        let detailsViewController = DetailsViewController()
        present(detailsViewController, animated: true, completion: nil)
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {

        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                AccountManager.shared.removeRecipeToUser(recipeToRemoveIndex: indexPath.row)
            }
        }
    }
    
    func getUserRecipes(username: String) -> [Recipe]? {
        return userAccount.recipes
    }
    
    func updateTable() {
        self.tableView.reloadData()
    }
}

