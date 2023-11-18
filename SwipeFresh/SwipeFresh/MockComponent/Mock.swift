//
//  Mock.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
class Mock {
    static var swipeViewModel: SwipeViewModel = SwipeViewModel(recipeStack: recipeStack)
    
    static var recipe: Recipe = Recipe(name: "String", image: "", ingredientItems: [], tags: [], prepTime: 1800, allergens: [], instructions: [])
    
    static var allergens: [Allergen] = [
        Allergen(name: "Fish", isSelected: false),
        Allergen(name: "Sojabeans", isSelected: false),
        Allergen(name: "Nuts", isSelected: false),
        Allergen(name: "Eggs", isSelected: false),
        Allergen(name: "Dairy free", isSelected: false),
        Allergen(name: "Gluten free", isSelected: false)
        
    ]
    static var recipeCard: RecipeCard = RecipeCard(recipe: recipe)
    
    static var recipeStack: [RecipeCard] = [recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard]

    static var mockRecipes: [Recipe] = [
        Recipe(
            name: "Mock Pasta",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63f4d66d8877805e4b01e49b-66a31f0c.jpg",
            ingredientItems: [],
            tags: [Tag(name: "Mock Italian")],
            prepTime: 20 * 60, // 20 minutes
            allergens: [Allergen(name: "Mock Eggs")],
            instructions: ["Cook mock spaghetti according to package instructions.", "In a bowl, mix mock eggs and grated mock parmesan.", "Fry mock bacon until crispy.", "Toss cooked mock spaghetti with egg mixture and bacon. Serve hot."]
        ),
        Recipe(
            name: "Mock Stir-Fry",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [],
            tags: [Tag(name: "Mock Asian")],
            prepTime: 15 * 60, // 15 minutes
            allergens: [Allergen(name: "Mock Soy")],
            instructions: ["Slice mock chicken into thin strips.", "Stir-fry mock chicken in a pan until cooked.", "Add mock broccoli and minced mock garlic, stir-fry until tender.", "Pour mock soy sauce over the mixture, stir well. Serve over mock rice."]
        )
    ]
}
