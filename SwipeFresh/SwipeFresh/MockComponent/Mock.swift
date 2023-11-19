//
//  Mock.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI
class Mock {
    @ObservedObject var viewModel: Dataloader
    init(viewModel: Dataloader) {
        self.viewModel = viewModel
    }
    static var learner = LearningAlgorithm()
    
    static var learnerBinding = Binding(get: {
        learner
    }, set: { val in
        learner = val
    })
    

    static var recipe: Recipe = Recipe(score: 0, name: "String", image: "", ingredientItems: [], tags: [], prepTime: 30 * 60, allergens: [], instructions: [])

    static var allergenRestrictions: [AllergenRestriction] = [
        AllergenRestriction(allergen: Allergen(name: "Fish"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Soy"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Nuts"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Eggs"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Dairy"), isSelected: false),
        AllergenRestriction(allergen: Allergen(name: "Gluten"), isSelected: false)

    ]
    static var recipeCard: RecipeCard = RecipeCard(recipe: recipe)
    
    //static var recipeStack: [RecipeCard] = mockRecipes.map( {RecipeCard(recipe: $0)})

    /*static var mockRecipes: [Recipe] = [
=======
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
>>>>>>> main
        Recipe(
            name: "Mock Pasta",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63f4d66d8877805e4b01e49b-66a31f0c.jpg",
            ingredientItems: [IngredientItem(ingredient: Ingredient(name: "Carrot", unit: nil), quantity: 30), IngredientItem(ingredient: Ingredient(name: "Apple", unit: nil), quantity: 30)],
            tags: [Tag(from: "Mock Italian" as! Decoder)],
            prepTime: 20 * 60, // 20 minutes
            cookTime: 40 * 60,
            allergens: [Allergen(name: "Mock Eggs")],
            instructions: ["Cook mock spaghetti according to package instructions.", "In a bowl, mix mock eggs and grated mock parmesan.", "Fry mock bacon until crispy.", "Toss cooked mock spaghetti with egg mixture and bacon. Serve hot."]
        ),
        Recipe(
            name: "Mock Stir-Fry",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [IngredientItem(ingredient: Ingredient(name: "Spinach", unit: nil), quantity: 30), IngredientItem(ingredient: Ingredient(name: "Apple", unit: nil), quantity: 30)],
            tags: [Tag(name: "Mock Asian")],
            prepTime: 15 * 60,
            cookTime: 30 * 60,
            allergens: [Allergen(name: "Mock Soy")],
            instructions: ["Slice mock chicken into thin strips.", "Stir-fry mock chicken in a pan until cooked.", "Add mock broccoli and minced mock garlic, stir-fry until tender.", "Pour mock soy sauce over the mixture, stir well. Serve over mock rice."]
        ),
        Recipe(
                name: "Mock Tacos",
                image: "https://example.com/mock-tacos.jpg",
                ingredientItems: [
                    IngredientItem(ingredient: Ingredient(name: "Mock Ground Beef", unit: nil), quantity: 1),
                    IngredientItem(ingredient: Ingredient(name: "Mock Taco Seasoning", unit: nil), quantity: 2),
                    IngredientItem(ingredient: Ingredient(name: "Mock Tortillas", unit: nil), quantity: 8),
                    IngredientItem(ingredient: Ingredient(name: "Mock Cheese", unit: nil), quantity: 1),
                    IngredientItem(ingredient: Ingredient(name: "Mock Lettuce", unit: nil), quantity: 1),
                    IngredientItem(ingredient: Ingredient(name: "Mock Tomatoes", unit: nil), quantity: 2)
                ],
                tags: [Tag(name: "Mock Mexican")],
                prepTime: 30 * 60, // 30 minutes
                allergens: [Allergen(name: "Mock Dairy")],
                instructions: [
                    "Cook mock ground beef in a pan until browned.",
                    "Add mock taco seasoning and water according to package instructions.",
                    "Warm mock tortillas in a dry skillet or microwave.",
                    "Assemble tacos with mock beef, cheese, lettuce, and tomatoes. Enjoy!"
                ]
            ),
        Recipe(
            name: "Mock Margherita Pizza",
            image: "https://example.com/mock-margherita-pizza.jpg",
            ingredientItems: [
                IngredientItem(ingredient: Ingredient(name: "Mock Pizza Dough", unit: nil), quantity: 1),
                IngredientItem(ingredient: Ingredient(name: "Mock Tomato Sauce", unit: nil), quantity: 0.5),
                IngredientItem(ingredient: Ingredient(name: "Mock Mozzarella Cheese", unit: nil), quantity: 1),
                IngredientItem(ingredient: Ingredient(name: "Mock Fresh Basil", unit: nil), quantity: 2)
            ],
            tags: [Tag(name: "Mock Italian")],
            prepTime: 25 * 60, // 25 minutes
            allergens: [Allergen(name: "Mock Gluten")],
            instructions: [
                "Preheat the oven to 450°F.",
                "Roll out mock pizza dough and place it on a baking sheet.",
                "Spread mock tomato sauce evenly over the dough.",
                "Sprinkle mock mozzarella cheese on top.",
                "Bake in the oven until the crust is golden and the cheese is bubbly.",
                "Top with fresh mock basil before serving."
            ]
        ),
        Recipe(
            name: "Mock Caesar Salad",
            image: "https://example.com/mock-caesar-salad.jpg",
            ingredientItems: [
                IngredientItem(ingredient: Ingredient(name: "Mock Romaine Lettuce", unit: nil), quantity: 1),
                IngredientItem(ingredient: Ingredient(name: "Mock Caesar Dressing", unit: nil), quantity: 0.5),
                IngredientItem(ingredient: Ingredient(name: "Mock Croutons", unit: nil), quantity: 0.5),
                IngredientItem(ingredient: Ingredient(name: "Mock Parmesan Cheese", unit: nil), quantity: 2)
            ],
            tags: [Tag(name: "Mock Salad")],
            prepTime: 15 * 60, // 15 minutes
            allergens: [Allergen(name: "Mock Dairy")],
            instructions: [
                "Wash and chop mock romaine lettuce.",
                "In a large bowl, toss the lettuce with mock Caesar dressing.",
                "Add mock croutons and toss again.",
                "Sprinkle mock Parmesan cheese on top.",
                "Serve immediately and enjoy!"
            ]
        ),
    ]*/
}
