//
//  RecipeDetailView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Display the recipe image
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .clipped()
                } placeholder: {
                    // You can provide a placeholder image or loading view here
                    Color.gray
                        .frame(maxWidth: .infinity, maxHeight: 200)
                }

                // Display the recipe name
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)

                // Display other details (e.g., tags, prep time, allergens)
                // Add your own code here based on your design

                Text("Tags: \(recipe.tags.map { $0.name }.joined(separator: ", "))")
                    .padding(.horizontal, 16)

                Text("Prep Time: \(Int(recipe.prepTime / 60)) mins")
                    .padding(.horizontal, 16)

                Text("Allergens: \(recipe.allergens.map { $0.name }.joined(separator: ", "))")
                    .padding(.horizontal, 16)

                // Display the ingredients
                Text("Ingredients:")
                    .font(.headline)
                    .padding(.horizontal, 16)

                ForEach(recipe.ingredientItems, id: \.self) { ingredientItem in
                    let formattedQuantity = String(format: "%.2f", ingredientItem.quantity)

                    Text("\(formattedQuantity) \(ingredientItem.ingredient.unit?.symbol ?? "") \(ingredientItem.ingredient.name)")
                        .padding(.horizontal, 16)
                }

                // Display the instructions
                Text("Instructions:")
                    .font(.headline)
                    .padding(.horizontal, 16)

                ForEach(0..<recipe.instructions.count, id: \.self) { index in
                    Text("\(index + 1). \(recipe.instructions[index])")
                        .padding(.horizontal, 16)
                        .padding(.bottom, index == recipe.instructions.count - 1 ? 16 : 8)
                }
            }
        }

    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock recipe for preview
        let mockRecipe = Recipe(
            name: "Crispy Cajun Chicken Sandwiches",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [
                IngredientItem(ingredient: Ingredient(name: "Flour", unit: UnitMass.grams), quantity: 200.0),
                IngredientItem(ingredient: Ingredient(name: "Sugar", unit: UnitVolume.cups), quantity: 1.0)
            ],
            tags: [Tag(name: "Dinner")],
            prepTime: 30 * 60, // 30 minutes
            allergens: [Allergen(name: "Nuts")],
            instructions: ["Mock Step", "Another Mock Step"]
        )

        // Preview the RecipeDetailView with the mock recipe
        NavigationView {
            RecipeDetailView(recipe: mockRecipe)
        }
    }
}
