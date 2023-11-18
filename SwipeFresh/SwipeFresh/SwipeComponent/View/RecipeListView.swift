//
//  RecipeListView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var viewModel: SwipeViewModel
    //var savedRecipes: [Recipe]
    @State private var searchText = ""
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return viewModel.likedRecipes
        } else {
            return viewModel.likedRecipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {

        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                List(viewModel.likedRecipes) { recipe in
                    RecipeListItemView(recipe: recipe)
                        .contentShape(Rectangle()) // Make the entire cell tappable
                        .padding(0) // Remove padding around the cell
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Saved Recipes")
            }
        }
    }

}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            .padding(.trailing, 0)
            .opacity(text.isEmpty ? 0 : 1)
            .disabled(text.isEmpty)
        }
        .padding()
    }
}
/*struct RecipeListView_Previews: PreviewProvider {
 static var previews: some View {
 let mockRecipes: [Recipe] = [
 Recipe(
 score: <#Double#>, name: "Mock Pasta",
 image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63d94b2977c8d43261096729-89774632.jpg",
 ingredientItems: [],
 tags: [Tag(name: "Mock Italian")],
 prepTime: 20 * 60, // 20 minutes
 allergens: [Allergen(name: "Mock Eggs")],
 instructions: ["Cook mock spaghetti according to package instructions.", "In a bowl, mix mock eggs and grated mock parmesan.", "Fry mock bacon until crispy.", "Toss cooked mock spaghetti with egg mixture and bacon. Serve hot."]
 ),
 Recipe(
 name: "Mock Stir-Fry",
 image: "https://img.hellofresh.com/w_2048,q_auto,f_auto,c_limit,fl_lossy/c_fill,f_auto,fl_lossy,h_432,q_auto/hellofresh_s3/image/63f4d66d8877805e4b01e49b-66a31f0c.jpg",
 ingredientItems: [],
 tags: [Tag(name: "Mock Asian")],
 prepTime: 15 * 60, // 15 minutes
 allergens: [Allergen(name: "Mock Soy")],
 instructions: ["Slice mock chicken into thin strips.", "Stir-fry mock chicken in a pan until cooked.", "Add mock broccoli and minced mock garlic, stir-fry until tender.", "Pour mock soy sauce over the mixture, stir well. Serve over mock rice."]
 )
 ]
 
 return RecipeListView(viewModel: mockRecipes)
 }
 }
 */
 
