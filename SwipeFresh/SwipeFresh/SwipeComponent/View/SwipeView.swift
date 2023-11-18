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
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .ignoresSafeArea()
                            
                            RecipeBigView(viewModel: viewModel, index: index)
                                
                                
                    } else {
                        RecipeSmallView(viewModel: viewModel, index: index)
                    }
                })
            }
            SwipeButtonsView(viewModel: viewModel)
            
        }
    }
    

}


#Preview {
    SwipeView(viewModel: Mock.swipeViewModel)
}
