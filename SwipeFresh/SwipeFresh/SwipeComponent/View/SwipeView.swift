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
            ZStack {
                ForEach(0..<viewModel.recipeStack.count, content: { index in
                    RecipeSmallView()
                    
                })
            }
            SwipeButtonsView(viewModel: viewModel)
            
        }
    }
    

}


#Preview {
    SwipeView(viewModel: Mock.swipeViewModel)
}
