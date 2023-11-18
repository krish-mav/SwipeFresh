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
                    RestrictionView(viewModel: RestrictionViewModel())
                        .tabItem {
                            Image(systemName: "person.fill")
                        }
                    SwipeView(viewModel: Mock.swipeViewModel)
                        .tabItem {
                            Image(systemName: "heart.fill")
                        }
                    RecipeListView(savedRecipes: Mock.mockRecipes)
                        .tabItem {
                            Image (systemName: "list.bullet")
                        }
                }
                .accentColor(Color("primary_darkest"))

    }
}

#Preview {
    MainView()
}
