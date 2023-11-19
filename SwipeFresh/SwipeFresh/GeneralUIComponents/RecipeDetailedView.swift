//
//  RecipeDetailedView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI
import Foundation

struct RecipeDetailedView: View {
    var recipe: Recipe
    
    let columns = [
               GridItem(.adaptive(minimum: 90))
           ]
    
    var body: some View {
        VStack(alignment: .leading) {
            if (!recipe.tags.isEmpty) {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(recipe.tags) { tag in
                        TagView(tagText: tag.name)
                    }
                    
                }
                .padding(5)
                
                
                Divider()
                    .background(.black)
            }
            
            HStack {
                TimeTagRecipeView(iconName: "clock", text: "\(recipe.prepTime) min", title: "Prep")
                            .padding(.trailing)
                
                Spacer()

            }
            .padding()
            
            Divider()
                .background(.black)
            
            Spacer().frame(height: 20)
            Text("Ingredients")
                .font(.title)
                .fontWeight(.bold)

            ForEach(recipe.ingredientItems, id: \.self) { item in
                if let unit = item.ingredient.unit {
                    IngredientView(
                        ingredient: item.ingredient.name,
                        unit: unit,
                        quantity: String(item.quantity))
                } else {
                    IngredientView(
                        ingredient: item.ingredient.name,
                        unit: "",
                        quantity: String(item.quantity))
                }
                
            }
            
            Divider()
                .background(.black)
            
            Text("Cooking steps")
                .font(.title)
                .fontWeight(.bold)
            ForEach(Array(zip(recipe.instructions.indices, recipe.instructions)), id: \.0) { index, instruction in
                            CookingStepView(number: index, text: instruction)
            }
            Spacer()
        }
        .padding()
    }
    
}

//#Preview {
//    RecipeDetailedView(recipe: Mock.swipeViewModel.getRecipe(index: 0))
//}
