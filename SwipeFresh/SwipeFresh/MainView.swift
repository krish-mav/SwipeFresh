//
//  MainScreen.swift
//  HallOfFame
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct MainView: View {
    init(learner: LearningAlgorithm = LearningAlgorithm()) {
        var orgLearner = learner
        var bindlearner = Binding(get: {
            orgLearner
        }, set: { val in
            orgLearner = val
        })
        self.viewModel = SwipeViewModel(recipes: Dataloader().recipeStack , learner: bindlearner)
    }
    var viewModel: SwipeViewModel
    var body: some View {
        TabView {
            restrictionView(viewModel: restrictionViewModel())
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            SwipeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                }.onAppear() {
                    Dataloader().load()
                }
            RecipeListView(viewModel: viewModel)
                .tabItem {
                    Image (systemName: "heart.fill")
                }

        }
        .accentColor(Color("primary_dark"))

    }
}

#Preview {
    MainView()
}
