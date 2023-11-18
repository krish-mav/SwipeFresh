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
}
