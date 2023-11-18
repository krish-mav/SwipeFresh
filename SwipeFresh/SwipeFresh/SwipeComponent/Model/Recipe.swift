//
//  Recipe.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation

struct Recipe: Identifiable {
    var score: Double = 0
    var id = UUID()
    var name: String
    var image: String
    var ingredientItems: [IngredientItem]
    var tags: [Tag]
    var prepTime: TimeInterval
    var allergens: [Allergen]
    var instructions: [String]
    var superLiked: Bool?



}
