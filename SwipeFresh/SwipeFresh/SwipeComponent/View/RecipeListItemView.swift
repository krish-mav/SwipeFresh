//
//  RecipeListItemView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeListItemView: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            // Display the recipe image (if available)
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                Color.gray
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .cornerRadius(10)
            }
            .padding(.bottom, 8)

            // Display the recipe name and prep time
            Text(recipe.name)
                .font(.headline)
            Text("Prep Time: \(Int(recipe.prepTime / 60)) mins")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            NavigationLink(
                destination: RecipeDetailView(recipe: recipe),
                label: {
                    EmptyView()
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 0, height: 0)
                .opacity(0)
        )
    }
}

struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock recipe for preview
        let mockRecipe = Recipe(
            name: "Mock Recipe",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [],
            tags: [Tag(name: "Dinner")],
            prepTime: 30 * 60, // 30 minutes
            allergens: [Allergen(name: "Nuts")],
            instructions: ["Step 1: Mock Step", "Step 2: Another Mock Step"]
        )

        // Preview the RecipeListItemView with the mock recipe
        RecipeListItemView(recipe: mockRecipe)
            .previewLayout(.sizeThatFits)
    }
}
