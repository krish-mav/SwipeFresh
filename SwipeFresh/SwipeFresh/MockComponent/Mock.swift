//
//  Mock.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
class Mock {
    static var swipeViewModel: SwipeViewModel = SwipeViewModel(recipeStack: recipeStack)
    
    static var recipe: Recipe = Recipe(title: "Test")
    
    static var recipeCard: RecipeCard = RecipeCard(recipe: Recipe())
    
    static var recipeStack: [RecipeCard] = [recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard]
}
