//
//  MainScreen.swift
//  HallOfFame
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct MainView: View {

    @ObservedObject var viewModel: SwipeViewModel
    @State private var selection = 3
    var body: some View {

        TabView(selection: $selection) {
            RestrictionView(viewModel: RestrictionViewModel())
                .tabItem {
                    Image(systemName: "checklist")
                }
                .tag(1)
            StatisticsView()
                .tabItem {
                    Image(systemName: "lightbulb.max.fill")
                }
                .tag(2)
            SwipeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "frying.pan")
                }.onAppear() {
                    Dataloader().load()
                }
                .tag(3)
            RecipeListView(viewModel: viewModel)
                .tabItem {
                    Image (systemName: "star.fill")
                }
                .tag(4)
        }
        .accentColor(Color("primary_darkest"))


    }
}

/*#Preview {
    MainView(viewModel: SwipeViewModel(recipes: [], learner: <#T##Binding<LearningAlgorithm>#>))
}
*/
