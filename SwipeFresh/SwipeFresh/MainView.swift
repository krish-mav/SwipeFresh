//
//  MainScreen.swift
//  HallOfFame
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            restrictionView(viewModel: restrictionViewModel())
                .tabItem {
                    Image(systemName: "heart.fill")
                }
                .tag(1)
            SwipeView(viewModel: Mock.swipeViewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                }
                .tag(2)
            RecipeListView(savedRecipes: Mock.mockRecipes)
                .tabItem {
                    Image (systemName: "heart.fill")
                }
                .tag(3)
        }
        .accentColor(Color("primary_dark"))

    }
}

#Preview {
    MainView()
}
