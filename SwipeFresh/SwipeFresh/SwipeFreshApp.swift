//
//  SwipeFreshApp.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

@main
struct SwipeFreshApp: App {
    init() {
        var orgLearner = LearningAlgorithm()
        var bindlearner = Binding(get: {
            orgLearner
        }, set: { val in
            orgLearner = val
        })
        self.viewModel = SwipeViewModel(recipes: Dataloader().recipeStack , learner: bindlearner)
    }
    var viewModel: SwipeViewModel
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: viewModel)
        }
    }
}

