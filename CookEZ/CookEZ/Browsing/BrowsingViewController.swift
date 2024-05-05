import UIKit
import SwiftUI

class BrowsingViewController: UIViewController{
    
    let recipeSetup = RecipeSetup()
    var recipes: [Recipe] = []
    var currentIndex: Int = 0
    
    var headerView = BrowsingHeaderView(frame: .zero)
    
    let scrollview = UIScrollView()
    var tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

extension BrowsingViewController {
    private func setup() {
        
        fetchData()
        style()
        layout()
        
    }
    
    private func style() {
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 6),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 1),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}
extension BrowsingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !recipes.isEmpty else {return UITableViewCell()}
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseID, for: indexPath) as! RecipeCell
        let recipe = recipes[indexPath.row]
        cell.configure(with: recipe)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
}

extension BrowsingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedRecipe = recipes[indexPath.row]
        
        let expandedView = ExpandedDetailsViewController()
        expandedView.recipeTitleString = selectedRecipe.name
        expandedView.imageSetter = selectedRecipe.previewImage
        expandedView.ingredientsString = RecipeSetup.shared.arrayToStringWithBreaks(selectedRecipe.ingredients)
        expandedView.prepStepsString = RecipeSetup.shared.arrayToStringWithBreaks(selectedRecipe.prepSteps)
        expandedView.directionsString = RecipeSetup.shared.arrayToStringWithBreaks(selectedRecipe.directions)
        expandedView.additionalInfoString = RecipeSetup.shared.arrayToStringWithBreaks(selectedRecipe.additionalInformation)
        present(expandedView, animated: true, completion: nil)
        
        print("Selected recipe: \(selectedRecipe.name)")
    }
}

extension BrowsingViewController {
    private func fetchData(){
        recipes = RecipeSetup.loadRecipes()
    }
    @objc func updateData(_ recognizer: UITapGestureRecognizer){
        fetchData()
        self.tableView.reloadData()
        refreshControl.endRefreshing()

    }
    
}
