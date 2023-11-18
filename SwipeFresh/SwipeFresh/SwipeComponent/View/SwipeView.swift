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
                    if viewModel.isShowingBottomSheet {

                            
                            RecipeBigView(viewModel: viewModel, index: index)
                                
                                
                    } else {
                        RecipeSmallView(viewModel: viewModel, index: index)
                    }
                })
            }
            .onChange(of: viewModel.currentRecipe) { oldValue, newValue in
                    print(viewModel.learner.data)
            }
            SwipeButtonsView(viewModel: viewModel)
            
        }
    }
    

}


#Preview {
    SwipeView(viewModel: Mock.swipeViewModel)
}
