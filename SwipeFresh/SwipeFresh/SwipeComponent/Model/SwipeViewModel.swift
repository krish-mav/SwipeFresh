//
//  SwipeViewModel.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation

class SwipeViewModel: ObservableObject {
    init(recipeStack: [Recipe]) {
        self.recipeStack = recipeStack
        self.savedRecipes = [Recipe]()
    }
    @Published var recipeStack: [Recipe]
    @Published var savedRecipes: [Recipe]
}
