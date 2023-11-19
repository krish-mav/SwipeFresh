//
//  JsonRecipe.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 19.11.23.
//

import Foundation

import Foundation

struct RecipeListWrapper: Codable {
    var recipes: [RecipeItem]?


}
struct RecipeItem: Codable {
    var recipe: JsonRecipe
}


struct JsonRecipe: Codable {
    var active: Bool
    var allergens: [String]?
    var rating: Double
    var description: String?
    var favorites: Int
    var imageUrl: String
    var ingredients: [RecipeIngredient]
    var recipeName: String?
    var instructions: [String]
    var tags: [String]
    var totalTime: String?

    enum CodingKeys: String, CodingKey {
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
        case totalTime
    }
}

struct RecipeIngredient: Codable {
    var yield: Int?
    var ingredients: [JsonIngredient]?
}

struct JsonIngredient: Codable {
    var name: String?
    var amount: Double?
    var unit: String?

    enum CodingKeys: String, CodingKey {
        case name
        case amount
        case unit
    }
}
