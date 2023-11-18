//
//  Learning-alogrithm.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

struct LearningAlgorithm {
    init(allergens: [Allergen] = Mock.allergens) {
        self.allergens = allergens
    }
    var data: [String: Double] = [:]
    var allergens: [Allergen]
    
    //add a new lable with a weight
    mutating func addLabel(label: String) {
        data[label] = 0
        
    }
    
    //manipulate weights according to input
    mutating func learn(card: RecipeCard) {
        var direction = card.liked
        for tag in card.recipe.tags {
            if !data.keys.contains(tag.name) {
                setLabel(label: tag.name, weight: 0)
            }
            setLabel(label: tag.name, weight: ((data[tag.name] ?? 0) + Double(direction) * 10))
            
        }
        for ingredientItem in card.recipe.ingredientItems {
            if !data.keys.contains(ingredientItem.ingredient.name) {
                setLabel(label: ingredientItem.ingredient.name, weight: 0)
            }
            setLabel(label: ingredientItem.ingredient.name, weight: ((data[ingredientItem.ingredient.name] ?? 0) + Double(direction) * 5))
        }
}
    
    //calculate score of a recipe
    mutating func calculate(recipe: Recipe) -> Double{
        for allergen in allergens {
            if recipe.allergens.contains(allergen) {
                return -1000
            }
        }
        var score: Double = 0
        for tag in recipe.tags {
            if data.keys.contains(tag.name) {
                score += data[tag.name] ?? 0
            } else {
                addLabel(label: tag.name)
            }
        }
        
        for ingredientItem in recipe.ingredientItems {
            if data.keys.contains(ingredientItem.ingredient.name) {
                score += data[ingredientItem.ingredient.name] ?? 0
            } else {
                addLabel(label: ingredientItem.ingredient.name)
            }
        }
        
        return score
    }
    
    //just setting the default values for allergies
    mutating func setLabel(label: String, weight: Double) {
        data[label] = weight
    }
    
}

