//
//  SwipeViewModel.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI

class SwipeViewModel: ObservableObject {
    init(recipeStack: [RecipeCard]) {
        self.recipeStack = recipeStack
        self.currentRecipe = recipeStack.count - 1

    }
    @Published var isShowingBottomSheet: Bool = false
    
    @Published var recipeStack: [RecipeCard]
    
    var lastRecipe: Int?
    
    var currentRecipe: Int
    
    func getRecipeCard(index: Int) -> RecipeCard {
        if recipeStack.count > index {
            recipeStack[index]
        } else {
            RecipeCard(recipe: Mock.recipe, offset: CGSize(width: -500, height: 0))
        }
    }
    
    func setRecipeCardOffset(index: Int, offset: CGSize) {
        if index >= 0 && index < self.recipeStack.count {
            self.recipeStack[index].offset = offset
        }
    }
    
    func setRecipeCardColor(index: Int, color: Color) {
        if index >= 0 && index < self.recipeStack.count {
            self.recipeStack[index].color = color
        }
    }
    
    func likeRecipe(index: Int) {
        if index >= 0 && index < self.recipeStack.count {
            self.recipeStack[index].liked = 1
        }
    }
    
    func dislikeRecipe(index: Int) {
        if index >= 0 && index < self.recipeStack.count {
            self.recipeStack[index].liked = -1
        }
    }
    
    func resetRecipe(index: Int) {
        if index >= 0 && index < self.recipeStack.count {
            self.recipeStack[index].liked = 0
        }
    }
    
    func getRecipe(index: Int) -> Recipe {
        if recipeStack.count > index {
            recipeStack[index].recipe
        } else {
            RecipeCard(recipe: Mock.recipe, offset: CGSize(width: -500, height: 0)).recipe
        }
    }
}
