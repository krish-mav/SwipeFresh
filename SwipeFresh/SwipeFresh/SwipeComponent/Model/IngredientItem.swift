//
//  IngredientItem.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct IngredientItem: Hashable {
    var ingredient: Ingredient
    var quantity: Double

    // Provide a hash value for instances of IngredientItem
    func hash(into hasher: inout Hasher) {
        hasher.combine(ingredient.id)
        hasher.combine(quantity)
    }
    
    static func == (lhs: IngredientItem, rhs: IngredientItem) -> Bool {
        if (lhs.ingredient.id == rhs.ingredient.id && lhs.quantity == rhs.quantity) {
            return true
        }
        return false
    }

}
