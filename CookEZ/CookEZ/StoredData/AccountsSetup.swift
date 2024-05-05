//
//  AccountsSetup.swift
//  CookEZ
//
//  Created by Admin on 4/8/24.
//

import UIKit
import SwiftUI

struct Account {
    let firstname: String
    let lastname: String
    let username: String
    let password: String
    var recipes: [Recipe]
}

class AccountsSetup {
    
    static func loadAccounts() -> [Account] {

        var accounts: [Account] = []
        
        let account1 = Account(firstname: "Josh", lastname: "Fowler", username: "Joshy", password: "Welcome",recipes: [Recipe(
            name: "Mushroom Risotto",
            author: "Giovanni Finne",
            previewImage: .mushroomRisotto,
            ingredients: ["Arborio Rice", "Mushrooms", "Chicken Broth", "Onion", "White Wine", "Parmesan Cheese", "Butter"],
            prepSteps: ["Sauté mushrooms and diced onion until softened", "Heat chicken broth"],
            directions: ["Toast rice in butter until translucent", "Add white wine and cook until evaporated", "Gradually add hot broth while stirring until rice is creamy"],
            additionalInformation: ["Stir in grated Parmesan cheese and season with salt and pepper"],
            globallyShared: true
        ),
        Recipe(
            name: "Chocolate Chip Cookies",
            author: "Chef Olivia",
            previewImage: .choclateChipCookies,
            ingredients: ["2 1/4 cups All-Purpose Flour", "1 cup Unsalted Butter (softened)", "3/4 cup Brown Sugar", "3/4 cup Granulated Sugar", "2 large Eggs", "1 tsp Vanilla Extract", "2 cups Semi-Sweet Chocolate Chips"],
                prepSteps: ["Preheat oven to 375°F (190°C)", "In a large mixing bowl, cream together softened butter, brown sugar, and granulated sugar until light and fluffy", "Beat in eggs, one at a time, then add vanilla extract"],
                directions: ["Gradually add all-purpose flour to the mixture and mix until well combined", "Fold in semi-sweet chocolate chips until evenly distributed"],
            additionalInformation: ["Drop tablespoon-sized portions of dough onto parchment-lined baking sheets", "Bake in preheated oven for 8-10 minutes, or until edges are golden brown"],
                globallyShared: true
        )])
        
        let account2 = Account(firstname: "Kyle", lastname: "Pasbuy", username: "KyleMan", password: "Welcome",recipes: [Recipe(
            name: "Tacos al Pastor",
            author: "Chef Miguel",
            previewImage: .alPastor,
            ingredients: ["1 lb Pork Shoulder (thinly sliced)", "1 small Pineapple (peeled and sliced)", "1 large Onion (sliced)", "1/4 cup Fresh Cilantro Leaves", "8 Corn Tortillas", "2 Limes (cut into wedges)", "2 Chili Peppers (sliced)"],
                prepSteps: ["Marinate thinly sliced pork shoulder with spices and pineapple juice for at least 2 hours", "Slice pineapple and onion thinly"],
                directions: ["Preheat grill to medium-high heat", "Skewer marinated pork slices and pineapple slices alternately on skewers", "Grill skewers until pork is cooked through and slightly charred, about 10-12 minutes", "Warm corn tortillas on the grill for 30 seconds on each side"],
                additionalInformation:["Serve grilled pork and pineapple on warm tortillas, topped with sliced onions, fresh cilantro, and chili peppers", "Squeeze lime wedges over the tacos before serving"],
                globallyShared: true
        ),
           Recipe(
           name: "Chicken Alfredo Pasta",
           author: "Sophia Sijn",
           previewImage: .chickenAlfredo,
           ingredients: ["Fettuccine Pasta", "Chicken Breast", "Heavy Cream", "Parmesan Cheese", "Butter", "Garlic"],
           prepSteps: ["Cook pasta until al dente", "Dice chicken breast"],
           directions: ["Sauté chicken and minced garlic in butter until cooked", "Pour in heavy cream and simmer", "Stir in grated Parmesan cheese until sauce is thickened"],
           additionalInformation: ["Garnish with chopped parsley and extra Parmesan cheese"],
           globallyShared: true)])
        
        let account3 = Account(firstname: "Judy", lastname: "Lasby", username: "Judybug", password: "Welcome",recipes:[Recipe(
            name: "Vegetable Stir-Fry",
            author: "Chef Mei",
            previewImage: .vegStirFry,
            ingredients: ["2 cups Assorted Vegetables (bell peppers, broccoli, carrots, mushrooms)", "2 tbsp Soy Sauce", "1 tsp Minced Ginger", "2 cloves Garlic (minced)", "2 tbsp Sesame Oil"],
               prepSteps: ["Cut assorted vegetables into thin slices or bite-sized pieces", "Mince ginger and garlic finely"],
               directions: ["Heat sesame oil in a wok over high heat", "Add minced ginger and garlic, sauté for 30 seconds", "Add vegetables and stir-fry until tender-crisp", "Add soy sauce and stir well to combine"],
               additionalInformation:["Serve hot over steamed rice or noodles for a complete meal"],
               globallyShared: true
        ),
        Recipe(
            name: "Classic Margherita Pizza",
            author: "Chef Antonio",
            previewImage: .margharitaPizza,
            ingredients: ["Pizza Dough", "Mozzarella Cheese", "Tomatoes", "Fresh Basil", "Olive Oil"],
            prepSteps: ["Stretch pizza dough into a circle", "Slice tomatoes and mozzarella"],
            directions: ["Top pizza dough with sliced tomatoes and mozzarella", "Bake until crust is golden and cheese is melted"],
            additionalInformation: ["Drizzle with olive oil and garnish with fresh basil"],
            globallyShared: true
        )])
        
        let account4 = Account(firstname: "Justin", lastname: "Lasuk", username: "JustLa", password: "Welcome",recipes: [Recipe(
            name: "Grilled Salmon with Lemon Butter",
            author: "Chef Emily",
            previewImage: .grilledLemonButterSalmon,
            ingredients: ["Salmon fillets", "Lemon", "Butter", "Garlic", "Salt", "Pepper"],
            prepSteps: ["Season salmon with salt and pepper", "Melt butter with minced garlic"],
            directions: ["Grill salmon until cooked through", "Brush with lemon butter while grilling"],
            additionalInformation: ["Serve with lemon wedges and fresh herbs"],
            globallyShared: true
        ),
        Recipe(
            name: "Caesar Salad",
            author: "Chef Marco",
            previewImage: .ceasarSalad,
            ingredients: ["Romaine Lettuce", "Croutons", "Parmesan Cheese", "Caesar Dressing"],
            prepSteps: ["Wash and chop lettuce", "Shave Parmesan cheese"],
            directions: ["Toss lettuce with dressing", "Add croutons and Parmesan cheese"],
            additionalInformation: ["Top with grilled chicken for a heartier meal"],
            globallyShared: true
        )])
        
        let account5 = Account(firstname: "Josia", lastname: "Fulsk", username: "JosiaFul", password: "Welcome",recipes: [Recipe(
            name: "Spaghetti Carbonara",
            author: "Mauh Mooyg",
            previewImage: .spaggetti,
            ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan cheese", "Black pepper", "Salt"],
            prepSteps: ["Cook spaghetti according to package instructions.", "Fry bacon until crispy.", "Whisk eggs and Parmesan cheese together.", "Combine cooked spaghetti with bacon and egg mixture.", "Season with black pepper and salt."],
            directions: ["In a large pot of boiling salted water, cook spaghetti according to package instructions until al dente. Drain well.", "Meanwhile, in a large skillet, cook bacon over medium heat until crispy, about 8-10 minutes. Transfer bacon to a paper towel-lined plate.", "In a small bowl, whisk together eggs and Parmesan; set aside.", "Working quickly, stir egg mixture into hot pasta. Add cooked bacon and toss to combine. Season with black pepper and additional salt, if needed.", "Serve immediately with extra Parmesan, if desired."],
            additionalInformation: ["Serves: 4", "Preparation time: 10 minutes", "Cooking time: 15 minutes"],
            globallyShared: true),
            Recipe(
                name: "Chicken Stir-Fry",
                author: "Fred Josy",
                previewImage: .chickenStirfry,
                ingredients: ["Chicken breast", "Bell peppers", "Broccoli", "Carrots", "Soy sauce", "Ginger", "Garlic"],
                prepSteps: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                directions: ["Slice chicken breast into thin strips.", "Cut bell peppers and broccoli into bite-sized pieces.", "Julienne carrots.", "In a wok or large skillet, heat oil over medium-high heat.", "Add chicken and cook until browned.", "Add vegetables and cook until tender-crisp.", "Stir in soy sauce, ginger, and garlic.", "Serve hot."],
                additionalInformation: ["Serves: 4", "Preparation time: 15 minutes", "Cooking time: 15 minutes"],
                globallyShared: true)])
        
        let account6 = Account(firstname: "Jonas", lastname: "Trent", username: "JohnasT", password: "Welcome",recipes: [Recipe(
            name: "Tacos al Pastor",
            author: "Chef Miguel",
            previewImage: .alPastor,
            ingredients: ["1 lb Pork Shoulder (thinly sliced)", "1 small Pineapple (peeled and sliced)", "1 large Onion (sliced)", "1/4 cup Fresh Cilantro Leaves", "8 Corn Tortillas", "2 Limes (cut into wedges)", "2 Chili Peppers (sliced)"],
                prepSteps: ["Marinate thinly sliced pork shoulder with spices and pineapple juice for at least 2 hours", "Slice pineapple and onion thinly"],
                directions: ["Preheat grill to medium-high heat", "Skewer marinated pork slices and pineapple slices alternately on skewers", "Grill skewers until pork is cooked through and slightly charred, about 10-12 minutes", "Warm corn tortillas on the grill for 30 seconds on each side"],
                additionalInformation:["Serve grilled pork and pineapple on warm tortillas, topped with sliced onions, fresh cilantro, and chili peppers", "Squeeze lime wedges over the tacos before serving"],
                globallyShared: true
        ),
          Recipe(
            name: "Mushroom Risotto",
            author: "Giovanni Finne",
            previewImage: .mushroomRisotto,
            ingredients: ["Arborio Rice", "Mushrooms", "Chicken Broth", "Onion", "White Wine", "Parmesan Cheese", "Butter"],
            prepSteps: ["Sauté mushrooms and diced onion until softened", "Heat chicken broth"],
            directions: ["Toast rice in butter until translucent", "Add white wine and cook until evaporated", "Gradually add hot broth while stirring until rice is creamy"],
            additionalInformation: ["Stir in grated Parmesan cheese and season with salt and pepper"],
            globallyShared: true
        )])
        
        accounts = [account1, account2, account3, account4, account5, account6]

        return accounts
    }
}
