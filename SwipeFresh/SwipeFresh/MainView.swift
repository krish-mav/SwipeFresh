//
//  MainScreen.swift
//  HallOfFame
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            restrictionView(viewModel: restrictionViewModel())
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            SwipeView(viewModel: Mock.swipeViewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            RecipeListView(savedRecipes: Mock.mockRecipes)
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
