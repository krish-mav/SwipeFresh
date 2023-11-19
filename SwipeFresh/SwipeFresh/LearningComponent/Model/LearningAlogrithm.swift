//
//  Learning-alogrithm.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

class LearningAlgorithm: ObservableObject {
    init(allergens: [Allergen] = Mock.allergenRestrictions.map( { $0.allergen})) {
        self.allergens = allergens
    }
    var data: [String: Double] = [:]
    var allergens: [Allergen]
    
    //add a new lable with a weight
    func addLabel(label: String) {
        data[label] = 0
        
    }
    
    func getXLowest(ingredients: [Ingredient], amount: Int) -> [Ingredient] {
        for ingredient in ingredients {
            if !data.keys.contains(ingredient.name) {
                setLabel(label: ingredient.name, weight: 0)
            }
        }
        var ingrNames = ingredients.map { $0.name }
        var foundIngredients = data.filter({ ingrNames.contains($0.key)}).sorted(by: { $0.value > $1.value})
        return foundIngredients.prefix(amount).map({ Ingredient(name: $0.key)})
    }
    
    //manipulate weights according to input
    func learn(card: RecipeCard) -> [String: Double] {
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
        return self.data
}
    
    //calculate score of a recipe
    func calculate(recipe: Recipe) -> Double{
        for allergen in self.allergens {
            if recipe.allergens.contains(where: {$0.name == allergen.name}) {
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
    func setLabel(label: String, weight: Double) {
        data[label] = weight
    }
    
}

