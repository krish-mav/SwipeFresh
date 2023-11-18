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
            SwipeView(viewModel: Mock.swipeViewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                }
        }
        .accentColor(Color("primary_dark"))

    }
}

#Preview {
    MainView()
}
