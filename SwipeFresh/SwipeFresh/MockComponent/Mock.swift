//
//  Mock.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
class Mock {
    static var swipeViewModel: SwipeViewModel = SwipeViewModel(recipeStack: recipeStack)
    
    static var recipe: Recipe = Recipe(name: "String", image: "", ingredientItems: [], tags: [], prepTime: 30 * 60, cookTime: 50 * 60, allergens: [], instructions: [])

    static var allergenRestrictions: [AllergenRestriction] = [
        AllergenRestriction(allergen: Allergen(name: "Fish"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Soy"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Nuts"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Eggs"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Dairy"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Gluten"), isSelected: false)

    ]
    static var recipeCard: RecipeCard = RecipeCard(recipe: recipe)
    
    static var recipeStack: [RecipeCard] = [recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard, recipeCard]

    static var mockRecipe = Recipe(
        name: "Crispy Cajun Chicken Sandwiches",
        image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
        ingredientItems: [
            IngredientItem(ingredient: Ingredient(name: "Flour", unit: UnitMass.grams), quantity: 200.0),
            IngredientItem(ingredient: Ingredient(name: "Sugar", unit: UnitVolume.cups), quantity: 1.0)
        ],
        tags: [Tag(name: "Dinner")],
        prepTime: 30 * 60,
        cookTime: 20 * 60,
        allergens: [Allergen(name: "Nuts")],
        instructions: ["Mock Step", "Another Mock Step"]
    )
    static var mockRecipes: [Recipe] = [
        Recipe(
            name: "Mock Pasta",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63f4d66d8877805e4b01e49b-66a31f0c.jpg",
            ingredientItems: [],
            tags: [Tag(name: "Mock Italian")],
            prepTime: 20 * 60, // 20 minutes
            cookTime: 40 * 60,
            allergens: [Allergen(name: "Mock Eggs")],
            instructions: ["Cook mock spaghetti according to package instructions.", "In a bowl, mix mock eggs and grated mock parmesan.", "Fry mock bacon until crispy.", "Toss cooked mock spaghetti with egg mixture and bacon. Serve hot."]
        ),
        Recipe(
            name: "Mock Stir-Fry",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [],
            tags: [Tag(name: "Mock Asian")],
            prepTime: 15 * 60,
            cookTime: 30 * 60,
            allergens: [Allergen(name: "Mock Soy")],
            instructions: ["Slice mock chicken into thin strips.", "Stir-fry mock chicken in a pan until cooked.", "Add mock broccoli and minced mock garlic, stir-fry until tender.", "Pour mock soy sauce over the mixture, stir well. Serve over mock rice."]
        )
    ]
}
