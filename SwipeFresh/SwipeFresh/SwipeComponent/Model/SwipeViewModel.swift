//
//  SwipeViewModel.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI

class SwipeViewModel: ObservableObject {
    init(recipes: [RecipeCard], learner: Binding<LearningAlgorithm>) {
        self.data = FreshStructure(learner: learner, recipes: recipes, minLength: 5)
        self.currentRecipe = 0
        self.learner = learner

    }
    @Published var isShowingBottomSheet: Bool = false
    
    @Published var data: FreshStructure
    
    @Published var learner: Binding<LearningAlgorithm>
    
    @Published var likedRecipes: [Recipe] = []
    
    @Published var isAnimating: Bool = false
    
    func learn(card: RecipeCard) {
        learner.wrappedValue.learn(card: card)
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
            newRecipe.recipe.score = learner.wrappedValue.calculate(recipe: recipe.recipe)
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
    
    func superLikeRecipe(index: Int) {
        if index >= 0 && index < self.data.recipeStack.count {
            self.data.recipeStack[index].liked = 3
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
    
    func getRecipe(index: Int) -> Recipe {
        if data.recipeStack.count > index {
            data.recipeStack[index].recipe
        } else {
            RecipeCard(recipe: Mock.recipe, offset: CGSize(width: -500, height: 0)).recipe
        }
    }
}
