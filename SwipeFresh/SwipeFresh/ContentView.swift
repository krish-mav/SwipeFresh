//
//  ContentView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SwipeView(viewModel: Mock.swipeViewModel)
        //Text("Test")
    }
}

#Preview {
    ContentView()
}
