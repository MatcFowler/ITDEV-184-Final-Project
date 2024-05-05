//
//  RecipeCell.swift
//  CookEZ
//
//  Created by Admin on 3/30/24.
//

import UIKit

class RecipeCell: UITableViewCell/*, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout*/  {
    
    struct RecipeViewModel {
        let name: String
        let author: String
        let thumbnailImage: UIImage
        let imageGallery: UIImage
        let ingredients: [String]
        let prepSteps: [String]
        let directions: [String]
        let additionalInformation: [String]
        let globallyShared: Bool
    }
    
    let typeLabel = UILabel()
    var dividerView = UIView()
    var nameLabel = UILabel()
    var addButtonImageView = UIImageView()
    var recipeImageView = UIImageView()
    var bottomDividerView = UIView()
    
    
    static let reuseID = "FilterCell"
    static let rowHeight: CGFloat = 280
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RecipeCell{
    private func setup(){
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.text = "Account Name"
        nameLabel.textColor = appColorMain
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = appColorForeGround
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.text = "Account type"
        typeLabel.textColor = appColorMain
        
        addButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        addButtonImageView.image = UIImage(systemName: "plus.square.fill")
        addButtonImageView.tintColor = appColorMain
        
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        recipeImageView.image = .browniesrecipephoto
        recipeImageView.layer.cornerRadius = 10
        recipeImageView.layer.masksToBounds = true
        
        bottomDividerView.translatesAutoresizingMaskIntoConstraints = false
        bottomDividerView.backgroundColor = appColorForeGround
        

        contentView.addSubview(typeLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(recipeImageView)
        contentView.addSubview(bottomDividerView)
        
        
    }
    private func layout(){
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            dividerView.widthAnchor.constraint(equalToConstant: 130),
            dividerView.heightAnchor.constraint(equalToConstant: 3),
            
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            recipeImageView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: recipeImageView.trailingAnchor, multiplier: 1),
            recipeImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            recipeImageView.heightAnchor.constraint(equalToConstant: 180),
            
            bottomDividerView.topAnchor.constraint(equalToSystemSpacingBelow: recipeImageView.bottomAnchor, multiplier: 0.5),
            bottomDividerView.heightAnchor.constraint(equalToConstant: 7),
            bottomDividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomDividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}

extension RecipeCell{
    func configure(with recipe: Recipe){
        
        typeLabel.text = recipe.author
        nameLabel.text = recipe.name
        let thumbnailImage = recipe.previewImage
        recipeImageView.image = thumbnailImage
        
    }
}
