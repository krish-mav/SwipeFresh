//
//  SwipeButtonsView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct SwipeButtonsView: View {
    @ObservedObject var viewModel: SwipeViewModel
    var body: some View {
        HStack (alignment: .center) {
            Button(action: {
                if let recipe = viewModel.lastRecipe {
                    viewModel.resetRecipe(index: recipe)
                    viewModel.currentRecipe = recipe
                    viewModel.lastRecipe = nil
                }
            }, label: {
                Image(systemName: "arrowshape.turn.up.left.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.yellow)
            })
            Spacer()
            Button(action: {
                viewModel.dislikeRecipe(index: viewModel.currentRecipe)
                viewModel.learner.wrappedValue.learn(card: viewModel.getRecipeCard(index: viewModel.currentRecipe))
            }, label: {
                Image(systemName: "xmark")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(.red)
            })
            Spacer()
            Button(action: {
                viewModel.likeRecipe(index: viewModel.currentRecipe)
                viewModel.learner.wrappedValue.learn(card: viewModel.getRecipeCard(index: viewModel.currentRecipe))
            }, label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(Color("primary_darkest"))
            })
            Spacer()
            Button(action: {
                withAnimation {
                    viewModel.isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    viewModel.superLikeRecipe(index: viewModel.currentRecipe)
                    viewModel.learner.wrappedValue.learn(card: viewModel.getRecipeCard(index: viewModel.currentRecipe))
                }
                
            }, label: {
                Image(systemName: "bolt.heart.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)

            })
        }
        .padding(.leading, 30)
        .padding(.bottom, 30)
        .padding(.trailing, 30)

    }
}

/*#Preview {
    SwipeButtonsView(viewModel: Mock.swipeViewModel)
}
*/
