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
                VStack {
                    Image("Lennard")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Text("Oh, you already looked at all new recipes! \nMaybe it's time to checkout those amazing saved ones.")
                        .bold()
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()
                        .foregroundColor(.gray.opacity(0.6))

                }
                ForEach((0..<viewModel.data.recipeStack.count).reversed(), id: \.self) { index in

                        RecipeSmallView(viewModel: viewModel, index: index)
                            .foregroundColor(.white)
                            .sheet(isPresented: $viewModel.isShowingBottomSheet) {
                                RecipeBigView(viewModel: viewModel, index: viewModel.currentRecipe)
                                    .transition(.slide)
                            }

                }
                .onChange(of: viewModel.currentRecipe) { oldValue, newValue in
                    if (viewModel.data.recipeStack.count - newValue) < 3 {
                        viewModel.populateStack(amount: 5)
                    }
                }
                
            }
            .onChange(of: viewModel.currentRecipe) { oldValue, newValue in
                print(viewModel.learner.wrappedValue.data)
            }
            Spacer()
            SwipeButtonsView(viewModel: viewModel)
            
        }
        .onAppear(perform: {
            viewModel.populate(amount: 5)
        })
        .overlay(content: {
            if viewModel.numLeft >= 5 {
                SwipePopupView(viewModel: viewModel)
            }
            if viewModel.isAnimating {
                withAnimation {
                    Image("lime_big")
                        .font(.system(size: 100))
                        .scaleEffect(size/10) // Make it larger
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


/*#Preview {
 SwipeView(viewModel: Mock.swipeViewModel)
 }
 */
