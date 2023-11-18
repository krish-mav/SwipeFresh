//
//  SwipeView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct SwipeView: View {
    @ObservedObject var viewModel: SwipeViewModel
    @State var size = 2.0
    var body: some View {
        VStack {
            ZStack {
                ForEach((0..<viewModel.data.recipeStack.count).reversed(), id: \.self) { index in
                    if viewModel.isShowingBottomSheet {

                            
                            RecipeBigView(viewModel: viewModel, index: index)

                                
                                
                    } else {
                        RecipeSmallView(viewModel: viewModel, index: index)
                            //.transition(.asymmetric(insertion: .scale(scale: .infinity), removal: .opacity))

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
        .overlay(content: {
            if viewModel.isAnimating {
                withAnimation {
                    Image("lime")
                        .font(.system(size: 100))
                        .scaleEffect(size) // Make it larger
                    //.opacity(0.0)     // Make it disappear
                        .animation(.interactiveSpring(duration: 1.0))
                        .onAppear {
                            self.size = 5
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                                viewModel.isAnimating = false
                                self.size = 2
                            }
                        }
                }
            }

        })
    }
    

}


#Preview {
    SwipeView(viewModel: Mock.swipeViewModel)
}
