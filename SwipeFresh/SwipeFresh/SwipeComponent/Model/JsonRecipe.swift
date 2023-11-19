//
//  JsonRecipe.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 19.11.23.
//

import Foundation

import Foundation

struct RecipeListWrapper: Codable {
    var recipes: [RecipeItem]
    
    func convert() -> [Recipe] {
        recipes.map({ $0.recipe.convert() })
    }


}
struct RecipeItem: Codable {
    var recipe: JsonRecipe
}


struct JsonRecipe: Codable {
    var active: Bool
    var allergens: [String]
    var rating: Double
    var description: String?
    var favorites: Int
    var imageUrl: String
    var ingredients: [RecipeIngredient]
    var recipeName: String
    var instructions: [String]
    var tags: [String]
    var totalTime: String?
    var score: Double?

    enum CodingKeys: String, CodingKey {
        case score
        case active
        case allergens
        case rating
        case description
        case favorites
        case imageUrl
        case ingredients
        case recipeName = "recipe_name"
        case instructions
        case tags
        case totalTime="prep_time"
    }
    
    func convert() -> Recipe {
        Recipe(score: score ?? 0, name: recipeName, image: imageUrl, ingredientItems: ingredients[0].convert(), tags: tags.map({ Tag(name: $0)}), prepTime: Int(totalTime ?? "0") ?? 0, allergens: allergens.map({ Allergen(name: $0) }) , instructions: instructions)
    }
}

struct RecipeIngredient: Codable {
    var yield: Int?
    var ingredients: [JsonIngredient]
    
    func convert() -> [IngredientItem] {
        return ingredients.map { $0.convert() }
    }
}

struct JsonIngredient: Codable {
    var name: String
    var amount: Double?
    var unit: String?

    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case unit
    }
    
    func convert() -> IngredientItem {
        IngredientItem(ingredient: Ingredient(name: name, unit: unit ?? ""), quantity: amount ?? 0)
    }
}
