//
//  RecipeDetailedView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct RecipeDetailedView: View {
    var recipe: Recipe
    
    let columns = [
               GridItem(.adaptive(minimum: 80))
           ]
    
    var body: some View {
        VStack(alignment: .leading) {
            if (!recipe.tags.isEmpty) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(recipe.tags) { tag in
                        TagView(tagText: tag.name)
                    }
                    
                }
                .padding()
                
                Divider()
                    .background(.black)
            }
            
            HStack {
                Spacer()
                    TimeTagRecipeView(iconName: "clock", text: String(100) + " min", title: "Prep")
                            .padding(.trailing)
                
                    TimeTagRecipeView(iconName: "clock", text: "45 min", title: "Prep")
                Spacer()

            }
            .padding()
            
            Divider()
                .background(.black)
            
            Spacer().frame(height: 20)
            Text("Ingredients")
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
                .background(.black)
            
            Text("Cooking steps")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    RecipeDetailedView(recipe: Mock.swipeViewModel.getRecipe(index: 0))
}
