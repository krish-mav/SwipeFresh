//
//  SwipeViewModel.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI

class SwipeViewModel: ObservableObject {
    init(data: Data, learner: LearningAlgorithm) {
        self.data = data
        self.currentRecipe = 0
        self.learner = learner

    }
    @Published var isShowingBottomSheet: Bool = false
    
    @Published var data: Data
    
    @Published var learner: LearningAlgorithm
    
    func learn(card: RecipeCard) {
        learner.learn(card: card)
    }
    
    func populate(amount: Int) {
        populateStack(amount: amount)
    }
    
    func populateStack(amount: Int = 4) {
        sort()
        score()
        var newRecipes = data.storageRecipes.prefix(amount)
        if amount > data.storageRecipes.count {
            data.storageRecipes = []
        } else {
            data.storageRecipes.removeFirst(amount)
        }
        data.recipeStack.append(contentsOf: newRecipes)
    }
    
    func sort() {
        data.storageRecipes.sort(by: { $0.recipe.score < $1.recipe.score})
    }
    
    func score() {
        data.storageRecipes = data.storageRecipes.map( { recipe in
            var newRecipe = recipe
            newRecipe.recipe.score = learner.calculate(recipe: recipe.recipe)
            return newRecipe
        })
    }
    var lastRecipe: Int?
    
    var currentRecipe: Int
        
    func getRecipeCard(index: Int) -> RecipeCard {
        if index >= 0 && data.recipeStack.count > index {
            data.recipeStack[index]
        } else {
            RecipeCard(recipe: Mock.recipe, offset: CGSize(width: -500, height: 0))
        }
    }
    
    func setRecipeCardOffset(index: Int, offset: CGSize) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].offset = offset
        }
    }
    
    func setRecipeCardColor(index: Int, color: Color) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].color = color
        }
    }
    
    func likeRecipe(index: Int) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].liked = 1
        }
    }
    
    func dislikeRecipe(index: Int) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].liked = -1
        }
    }
    
    func resetRecipe(index: Int) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].liked = 0
        }
    }
}
