//
//  RecipeDetailView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var isPresented: Binding<Bool>
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("primary_darkest"))
                .ignoresSafeArea()
            
            HStack {
                Button(action: {
                    isPresented.wrappedValue = false
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                })
                Spacer()
            }
        }
        
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: recipe.image)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image("Placeholder")
                        .resizable()
                }
                .scaledToFit()
                
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding()
            
            Text(recipe.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            RecipeDetailedView(recipe: recipe)
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
        let isPresented = Binding(get: {
            true
        }, set: { val in
            
        })

        // Preview the RecipeDetailView with the mock recipe
        NavigationView {
            RecipeDetailView(recipe: mockRecipe, isPresented: isPresented)
        }
    }
}
