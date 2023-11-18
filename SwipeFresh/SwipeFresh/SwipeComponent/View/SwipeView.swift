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
                ForEach((0..<viewModel.data.recipeStack.count).reversed(), id: \.self) { index in
                    if viewModel.isShowingBottomSheet {

                            
                            RecipeBigView(viewModel: viewModel, index: index)
                                
                                
                    } else {
                        RecipeSmallView(viewModel: viewModel, index: index)
                    }
                }
                .onChange(of: viewModel.currentRecipe) { oldValue, newValue in
                    if (viewModel.data.recipeStack.count - newValue) < 3 {
                        viewModel.populateStack(amount: 2)
                    }
                }
                
            }
            .onChange(of: viewModel.currentRecipe) { oldValue, newValue in
                    print(viewModel.learner.data)
            }
            SwipeButtonsView(viewModel: viewModel)
            
        }
        .onAppear(perform: {
            viewModel.populate(amount: 2)
        })
    }
    

}


/*#Preview {
 SwipeView(viewModel: Mock.swipeViewModel)
 }
 */
