//
//  IngredientItem.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct IngredientItem: Hashable, Codable {
    var ingredient: Ingredient
    var quantity: Double
    
    init(ingredient: Ingredient, quantity: Double) {
        self.ingredient = ingredient
        self.quantity = quantity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ingredient = try container.decode(Ingredient.self, forKey: .ingredient)
        self.quantity = try container.decode(Double.self, forKey: .quantity)
    }

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
    
    enum CodingKeys: String, CodingKey {
            case ingredient
            case quantity
        }

}
