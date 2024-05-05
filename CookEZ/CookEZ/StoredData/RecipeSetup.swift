//
//  RecipeSetup.swift
//  CookEZ
//
//  Created by Admin on 4/8/24.
//
import UIKit
import SwiftUI

struct Recipe {
    var name: String
    var author: String
    var previewImage: UIImage
    var ingredients: [String]
    var prepSteps: [String]
    var directions: [String]
    var additionalInformation: [String]
    var globallyShared: Bool
}

var recipes: [Recipe] = []

class RecipeSetup {
    
    static let shared = RecipeSetup()

    static func loadInitalData(){
        recipes = [Recipe(
            name: "Spaghetti Carbonara",
            author: "John Hoky",
            previewImage: .spaggetti,
            ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan cheese", "Black pepper", "Salt"],
            prepSteps: ["Cook spaghetti according to package instructions.", "Fry bacon until crispy.", "Whisk eggs and Parmesan cheese together.", "Combine cooked spaghetti with bacon and egg mixture.", "Season with black pepper and salt."],
            directions: ["In a large pot of boiling salted water, cook spaghetti according to package instructions until al dente. Drain well.", "Meanwhile, in a large skillet, cook bacon over medium heat until crispy, about 8-10 minutes. Transfer bacon to a paper towel-lined plate.", "In a small bowl, whisk together eggs and Parmesan; set aside.", "Working quickly, stir egg mixture into hot pasta. Add cooked bacon and toss to combine. Season with black pepper and additional salt, if needed.", "Serve immediately with extra Parmesan, if desired."],
            additionalInformation: ["Serves: 4", "Preparation time: 10 minutes", "Cooking time: 15 minutes"],
            globallyShared: true),Recipe(
                name: "Chicken Stir-Fry",
                author: "Jaiy Naohu",
                previewImage: .chickenStirfry,
                ingredients: ["Chicken breast", "Bell peppers", "Broccoli", "Carrots", "Soy sauce", "Ginger", "Garlic"],
                prepSteps: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                directions: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                additionalInformation: ["Serves: 4", "Preparation time: 15 minutes", "Cooking time: 15 minutes"],
                globallyShared: true),Recipe(
                    name: "Spaghetti Carbonara",
                    author: "Mauh Mooyg",
                    previewImage: .spaggetti,
                    ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan cheese", "Black pepper", "Salt"],
                    prepSteps: ["Cook spaghetti according to package instructions.", "Fry bacon until crispy.", "Whisk eggs and Parmesan cheese together.", "Combine cooked spaghetti with bacon and egg mixture.", "Season with black pepper and salt."],
                    directions: ["In a large pot of boiling salted water, cook spaghetti according to package instructions until al dente. Drain well.", "Meanwhile, in a large skillet, cook bacon over medium heat until crispy, about 8-10 minutes. Transfer bacon to a paper towel-lined plate.", "In a small bowl, whisk together eggs and Parmesan; set aside.", "Working quickly, stir egg mixture into hot pasta. Add cooked bacon and toss to combine. Season with black pepper and additional salt, if needed.", "Serve immediately with extra Parmesan, if desired."],
                    additionalInformation: ["Serves: 4", "Preparation time: 10 minutes", "Cooking time: 15 minutes"],
                    globallyShared: true),Recipe(
                        name: "Chicken Stir-Fry",
                        author: "Fred Josy",
                        previewImage: .chickenStirfry,
                        ingredients: ["Chicken breast", "Bell peppers", "Broccoli", "Carrots", "Soy sauce", "Ginger", "Garlic"],
                        prepSteps: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                        directions: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                        additionalInformation: ["Serves: 4", "Preparation time: 15 minutes", "Cooking time: 15 minutes"],
                        globallyShared: true),Recipe(
                            name: "Spaghetti Carbonara",
                            author: "Jessia Sinnm",
                            previewImage: .spaggetti,
                            ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan cheese", "Black pepper", "Salt"],
                            prepSteps: ["Cook spaghetti according to package instructions.", "Fry bacon until crispy.", "Whisk eggs and Parmesan cheese together.", "Combine cooked spaghetti with bacon and egg mixture.", "Season with black pepper and salt."],
                            directions: ["In a large pot of boiling salted water, cook spaghetti according to package instructions until al dente. Drain well.", "Meanwhile, in a large skillet, cook bacon over medium heat until crispy, about 8-10 minutes. Transfer bacon to a paper towel-lined plate.", "In a small bowl, whisk together eggs and Parmesan; set aside.", "Working quickly, stir egg mixture into hot pasta. Add cooked bacon and toss to combine. Season with black pepper and additional salt, if needed.", "Serve immediately with extra Parmesan, if desired."],
                            additionalInformation: ["Serves: 4", "Preparation time: 10 minutes", "Cooking time: 15 minutes"],
                            globallyShared: true),Recipe(
                                name: "Chicken Stir-Fry",
                                author: "Jake Smich",
                                previewImage: .chickenStirfry,
                                ingredients: ["Chicken breast", "Bell peppers", "Broccoli", "Carrots", "Soy sauce", "Ginger", "Garlic"],
                                prepSteps: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                                directions: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                                additionalInformation: ["Serves: 4", "Preparation time: 15 minutes", "Cooking time: 15 minutes"],
                                globallyShared: true),Recipe(
                                    name: "Spaghetti Carbonara",
                                    author: "Chef Luigi",
                                    previewImage: .spaggetti,
                                    ingredients: ["200g Spaghetti", "2 Eggs", "100g Pancetta", "1/2 cup Grated Parmesan Cheese", "1/2 tsp Ground Black Pepper"],
                                    prepSteps: ["Cook spaghetti in boiling salted water until al dente", "Beat eggs with grated Parmesan cheese in a bowl"],
                                    directions: ["Fry pancetta in a pan until crispy", "Mix cooked spaghetti with crispy pancetta", "Pour egg mixture over spaghetti and toss quickly", "Season with black pepper and serve hot"],
                                    additionalInformation:["Garnish with extra Parmesan cheese and black pepper if desired"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Grilled Salmon with Lemon Butter",
                                    author: "Chef Emily",
                                    previewImage: .grilledLemonButterSalmon,
                                    ingredients: ["4 Salmon Fillets (6 oz each)", "1 Lemon", "4 tbsp Butter", "2 cloves Garlic (minced)", "Salt to taste", "Black Pepper to taste"],
                                    prepSteps: ["Season salmon fillets with salt and pepper", "Melt butter in a pan and add minced garlic to it"],
                                    directions: ["Grill salmon fillets over medium-high heat until cooked through, about 4-5 minutes per side", "Brush salmon with lemon butter while grilling for added flavor"],
                                    additionalInformation:["Serve hot with lemon wedges and fresh herbs for garnish"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Caesar Salad",
                                    author: "Chef Marco",
                                    previewImage: .ceasarSalad,
                                    ingredients: ["Romaine Lettuce", "Croutons", "Parmesan Cheese", "Caesar Dressing"],
                                    prepSteps: ["Wash and chop lettuce", "Shave Parmesan cheese"],
                                    directions: ["Toss lettuce with dressing", "Add croutons and Parmesan cheese"],
                                    additionalInformation: ["Top with grilled chicken for a heartier meal"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Vegetable Stir-Fry",
                                    author: "Chef Mei",
                                    previewImage: .vegStirFry,
                                    ingredients: ["2 cups Assorted Vegetables (bell peppers, broccoli, carrots, mushrooms)", "2 tbsp Soy Sauce", "1 tsp Minced Ginger", "2 cloves Garlic (minced)", "2 tbsp Sesame Oil"],
                                    prepSteps: ["Cut assorted vegetables into thin slices or bite-sized pieces", "Mince ginger and garlic finely"],
                                    directions: ["Heat sesame oil in a wok over high heat", "Add minced ginger and garlic, sauté for 30 seconds", "Add vegetables and stir-fry until tender-crisp", "Add soy sauce and stir well to combine"],
                                    additionalInformation:["Serve hot over steamed rice or noodles for a complete meal"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Classic Margherita Pizza",
                                    author: "Chef Antonio",
                                    previewImage: .margharitaPizza,
                                    ingredients: ["1 batch Pizza Dough", "1 cup Fresh Mozzarella Cheese (sliced)", "2 Plum Tomatoes (sliced)", "1/4 cup Fresh Basil Leaves", "2 tbsp Olive Oil"],
                                    prepSteps: ["Stretch pizza dough into a round shape on a pizza stone or baking sheet", "Slice fresh mozzarella and plum tomatoes thinly"],
                                    directions: ["Preheat oven to 450°F (230°C)", "Top pizza dough with sliced mozzarella and tomatoes, leaving a border around the edges", "Drizzle olive oil over the top and bake in preheated oven for 12-15 minutes, or until crust is golden brown"],
                                    additionalInformation:["Garnish with fresh basil leaves before serving"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Chicken Alfredo Pasta",
                                    author: "Sophia Sijn",
                                    previewImage: .chickenAlfredo,
                                    ingredients: ["Fettuccine Pasta", "Chicken Breast", "Heavy Cream", "Parmesan Cheese", "Butter", "Garlic"],
                                    prepSteps: ["Cook pasta until al dente", "Dice chicken breast"],
                                    directions: ["Sauté chicken and minced garlic in butter until cooked", "Pour in heavy cream and simmer", "Stir in grated Parmesan cheese until sauce is thickened"],
                                    additionalInformation: ["Garnish with chopped parsley and extra Parmesan cheese"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Berry Smoothie Bowl",
                                    author: "Chef Ava",
                                    previewImage: .berrySmoothieBowl,
                                    ingredients: ["1 cup Frozen Mixed Berries", "1 ripe Banana", "1/2 cup Greek Yogurt", "1 tbsp Honey", "1/4 cup Granola", "1 tbsp Chia Seeds"],
                                    prepSteps: ["In a blender, combine frozen berries, banana, and Greek yogurt", "Blend until smooth and creamy"],
                                    directions: ["Pour smoothie into a bowl", "Drizzle honey over the top", "Sprinkle granola and chia seeds for crunch and texture"],
                                    additionalInformation:["Top with additional fresh berries and sliced banana for extra sweetness"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Tacos al Pastor",
                                    author: "Chef Miguel",
                                    previewImage: .alPastor,
                                    ingredients: ["1 lb Pork Shoulder (thinly sliced)", "1 small Pineapple (peeled and sliced)", "1 large Onion (sliced)", "1/4 cup Fresh Cilantro Leaves", "8 Corn Tortillas", "2 Limes (cut into wedges)", "2 Chili Peppers (sliced)"],
                                    prepSteps: ["Marinate thinly sliced pork shoulder with spices and pineapple juice for at least 2 hours", "Slice pineapple and onion thinly"],
                                    directions: ["Preheat grill to medium-high heat", "Skewer marinated pork slices and pineapple slices alternately on skewers", "Grill skewers until pork is cooked through and slightly charred, about 10-12 minutes", "Warm corn tortillas on the grill for 30 seconds on each side"],
                                    additionalInformation:["Serve grilled pork and pineapple on warm tortillas, topped with sliced onions, fresh cilantro, and chili peppers", "Squeeze lime wedges over the tacos before serving"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Mushroom Risotto",
                                    author: "Giovanni Finne",
                                    previewImage: .mushroomRisotto,
                                    ingredients: ["Arborio Rice", "Mushrooms", "Chicken Broth", "Onion", "White Wine", "Parmesan Cheese", "Butter"],
                                    prepSteps: ["Sauté mushrooms and diced onion until softened", "Heat chicken broth"],
                                    directions: ["Toast rice in butter until translucent", "Add white wine and cook until evaporated", "Gradually add hot broth while stirring until rice is creamy"],
                                    additionalInformation: ["Stir in grated Parmesan cheese and season with salt and pepper"],
                                    globallyShared: true
                                ),Recipe(
                                    name: "Chocolate Chip Cookies",
                                    author: "Chef Olivia",
                                    previewImage: .choclateChipCookies,
                                    ingredients: ["2 1/4 cups All-Purpose Flour", "1 cup Unsalted Butter (softened)", "3/4 cup Brown Sugar", "3/4 cup Granulated Sugar", "2 large Eggs", "1 tsp Vanilla Extract", "2 cups Semi-Sweet Chocolate Chips"],
                                    prepSteps: ["Preheat oven to 375°F (190°C)", "In a large mixing bowl, cream together softened butter, brown sugar, and granulated sugar until light and fluffy", "Beat in eggs, one at a time, then add vanilla extract"],
                                    directions: ["Gradually add all-purpose flour to the mixture and mix until well combined", "Fold in semi-sweet chocolate chips until evenly distributed"],
                                    additionalInformation: ["Drop tablespoon-sized portions of dough onto parchment-lined baking sheets", "Bake in preheated oven for 8-10 minutes, or until edges are golden brown"],
                                    globallyShared: true
                                )]
    }

    
    static func loadRecipes() -> [Recipe] {
        return recipes
        }
    func addRecipe(_ recipeToAdd: Recipe){
        if let recipeIndex = recipes.firstIndex(where: { $0.name == recipeToAdd.name && $0.author == recipeToAdd.author }) {
            recipes[recipeIndex].name.removeAll()
            recipes[recipeIndex].name.append(recipeToAdd.name)
            recipes[recipeIndex].previewImage = recipeToAdd.previewImage
            recipes[recipeIndex].additionalInformation.removeAll()
            recipes[recipeIndex].additionalInformation.append(contentsOf: recipeToAdd.additionalInformation)
            recipes[recipeIndex].directions.removeAll()
            recipes[recipeIndex].directions.append(contentsOf: recipeToAdd.directions)
            recipes[recipeIndex].ingredients.removeAll()
            recipes[recipeIndex].ingredients.append(contentsOf: recipeToAdd.ingredients)
            recipes[recipeIndex].prepSteps.removeAll()
            recipes[recipeIndex].prepSteps.append(contentsOf: recipeToAdd.prepSteps)
        }else{
            recipes.append(recipeToAdd)
        }
    }
    func arrayToStringWithBreaks(_ array: [String]) -> String {
        return array.joined(separator: "\n")
    }
    
    
}
