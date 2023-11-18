//
//  RecipeListView.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import SwiftUI

struct RecipeListView: View {
    var savedRecipes: [Recipe]
    @State private var searchText = ""
    var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return savedRecipes
        } else {
            return savedRecipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {

        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                List(savedRecipes) { recipe in
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
struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        return RecipeListView(savedRecipes: Mock.mockRecipes)
    }
}
