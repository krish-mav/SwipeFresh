//
//  RecipeListItemView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeListItemView: View {
    var recipe: Recipe
    @State var isPresented = false
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
        .onTapGesture {
            isPresented = true
        }
        .padding()
        .fullScreenCover(isPresented: $isPresented, content: {
            RecipeDetailView(recipe: recipe, isPresented: $isPresented)
        })

    }
}

/*struct RecipeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock recipe for preview
        let mockRecipe = Recipe(
            score: 28, name: "Mock Recipe",
            image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
            ingredientItems: [],
            tags: [Tag(from: "Dinner" as! Decoder)],
            prepTime: 30 * 60, // 30 minutes
            cookTime: 20 * 60,
            allergens: [Allergen(name: "Nuts")],
            instructions: ["Step 1: Mock Step", "Step 2: Another Mock Step"]
        )

        // Preview the RecipeListItemView with the mock recipe
        RecipeListItemView(recipe: mockRecipe)
            .previewLayout(.sizeThatFits)
    }
}*/
