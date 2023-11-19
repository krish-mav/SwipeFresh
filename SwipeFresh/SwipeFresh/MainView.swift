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
    @State private var selection = 2
    var body: some View {

        TabView(selection: $selection) {
            RestrictionView(viewModel: RestrictionViewModel())
                .tabItem {
                    Image(systemName: "checklist")
                }
                .tag(1)
            SwipeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "frying.pan")
                }.onAppear() {
                    Dataloader().load()
                }
                .tag(2)
            RecipeListView(viewModel: viewModel)
                .tabItem {
                    Image (systemName: "star.fill")
                }
                .tag(3)
        }
        .accentColor(Color("primary_darkest"))


    }
}

#Preview {
    MainView()
}
