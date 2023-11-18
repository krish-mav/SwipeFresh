//
//  Recipe.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    var score: Double = 0
    var id = UUID()
    var name: String
    var image: String
    var ingredientItems: [IngredientItem]
    var tags: [Tag]
    var prepTime: TimeInterval
    var allergens: [Allergen]
    var instructions: [String]
    
    init(score: Double, id: UUID = UUID(), name: String, image: String, ingredientItems: [IngredientItem], tags: [Tag], prepTime: TimeInterval, allergens: [Allergen], instructions: [String]) {
        self.score = score
        self.id = id
        self.name = name
        self.image = image
        self.ingredientItems = ingredientItems
        self.tags = tags
        self.prepTime = prepTime
        self.allergens = allergens
        self.instructions = instructions
    }

    private enum CodingKeys: String, CodingKey {
            case score
            case id
            case name
            case image
            case ingredientItems
            case tags
            case prepTime
            case allergens
            case instructions
        }

}
