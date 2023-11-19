//
//  Data.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI

struct FreshStructure {
    init(learner: Binding<LearningAlgorithm>, recipes: [RecipeCard], minLength: Int) {
        self.learner = learner
        self.recipeStack = []
        self.storageRecipes = Array(recipes.prefix(20))
        self.minLength = minLength
    }
    //@ObservedObject var viewModel: SwipeViewModel
    var learner: Binding<LearningAlgorithm>
    var recipeStack: [RecipeCard]
    var storageRecipes: [RecipeCard]
    var minLength: Int
    
    
    

}
