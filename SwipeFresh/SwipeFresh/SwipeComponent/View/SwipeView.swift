//
//  SwipeView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct SwipeView: View {
    @ObservedObject var viewModel: SwipeViewModel
    var body: some View {
        VStack {
            RecipeSmallView()
                .padding(40)
            SwipeButtonsView()
            ContentView()
                .badge(2)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            ContentView()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            ContentView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}


#Preview {
    SwipeView(viewModel: Mock.swipeViewModel)
}
