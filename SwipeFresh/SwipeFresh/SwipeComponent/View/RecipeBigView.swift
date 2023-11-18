//
//  RecipeBigView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct RecipeBigView: View {
    @ObservedObject var viewModel: SwipeViewModel
    var index: Int
    @State var photoSpacer: CGFloat = 700
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                VStack {
                    Image("Placeholder")
                        .resizable()
                        
                        .scaledToFit()
                    Spacer()
                        .frame(height: photoSpacer)
                }
                
                VStack {
                    Spacer()
                        .frame(minHeight: 200)
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 700)
                        
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            
                            HStack(alignment: .bottom) {
                                Text(viewModel.getRecipe(index: index).name)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Spacer()
                                Button(action: {
                                    withAnimation(Animation.linear(duration: 0.5)) {
                                        photoSpacer = 700
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        viewModel.isShowingBottomSheet.toggle()
                                    }
                                }, label: {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .foregroundColor(Color("primary_darkest"))
                                        .font(.largeTitle)
                                })
                                
                            }
                            
                            RecipeDetailedView(recipe: viewModel.getRecipe(index: index))
                            Spacer()
                        }
                        .padding()
                    }
                    Spacer()
                }
                
                
            }
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 0.5)) {
                    photoSpacer = 100
                }
            })
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    RecipeBigView(viewModel: Mock.swipeViewModel, index: 0)
}

