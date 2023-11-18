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
    
    static var recipeStack: [Recipe] = [recipe, recipe]
    
    static var allergens: [Allergen] = [
        Allergen(name: "Fish", isSelected: false),
        Allergen(name: "Sojabeans", isSelected: false),
        Allergen(name: "Nuts", isSelected: false),
        Allergen(name: "Eggs", isSelected: false),
        Allergen(name: "Dairy free", isSelected: false),
        Allergen(name: "Gluten free", isSelected: false)
        
    ]
}
