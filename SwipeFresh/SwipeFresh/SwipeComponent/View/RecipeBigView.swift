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
    @State var initPadding: CGFloat = 10
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                
                VStack {
                    AsyncImage(url: URL(string: viewModel.getRecipe(index: index).image)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Image("Placeholder")
                            .resizable()
                    }
                    
                    .scaledToFit()
                    //for Overlaping
                    Spacer()
                        .frame(height: photoSpacer)
                }
                //for Overlaping
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
                                    withAnimation {
                                        self.initPadding = 10
                                    }
                                    withAnimation(Animation.linear(duration: 0.5)) {
                                        photoSpacer = 700
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        viewModel.isShowingBottomSheet.toggle()
                                    }
                                }, label: {
                                    Image(systemName: "arrow.down.circle.fill")
                                        .foregroundColor(Color("primary_dark"))
                                        .font(.largeTitle)
                                })
                                
                            }.padding([.top,.leading,.trailing])
                            
                            RecipeDetailedView(recipe: viewModel.getRecipe(index: index))
                            
                            Spacer()
                        }.fixedSize(horizontal: false, vertical: true)
                            .onChange(of: viewModel.getRecipeCard(index: index).liked, { oldValue, newValue in
                                if newValue == 1 {
                                    withAnimation(Animation.easeInOut(duration: 1.0)) {
                                        viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 500, height: 0))
                                        changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                                        viewModel.currentRecipe = index + 1
                                        viewModel.lastRecipe = index
                                        viewModel.isShowingBottomSheet = false
                                    }
                                    
                                } else if newValue == 3 {
                                    withAnimation(Animation.snappy(duration: 2.0)) {
                                        viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 0, height: -6000))
                                        changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                                        viewModel.currentRecipe = index + 1
                                        viewModel.lastRecipe = index
                                        viewModel.isShowingBottomSheet = false
                                    }
                                    
                                } else if newValue == -1 {
                                    withAnimation(Animation.easeInOut(duration: 1.0)) {
                                        viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: -500, height: 0))
                                        changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                                        viewModel.currentRecipe = index + 1
                                        viewModel.lastRecipe = index
                                        viewModel.isShowingBottomSheet = false
                                    }
                                } else if newValue == 0 {
                                    withAnimation(Animation.interactiveSpring(duration: 1.0)) {
                                        //viewModel.resetRecipe(index: index)
                                        viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 0, height: 0))
                                        changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                                        //viewModel.currentRecipe += 1
                                    }
                                }
                            })
                        
                        Spacer()
                    }
                    
                    
                }
                .onAppear(perform: {
                    withAnimation {
                        self.initPadding = 0
                    }
                    if viewModel.getRecipeCard(index: index).liked == 0 {
                        withAnimation(Animation.linear(duration: 0.5)) {
                            photoSpacer = 100
                        }
                    }
                })
                .ignoresSafeArea()
                .offset(x: viewModel.getRecipeCard(index: index).offset.width, y: viewModel.getRecipeCard(index: index).offset.height * 0.4)
                
            }
        }
    }
    func changeColor(width: CGFloat) {
        switch width {
            case -500...(-100):
                viewModel.setRecipeCardColor(index: index, color: .red.opacity(0.3))
            case 100...(500):
                viewModel.setRecipeCardColor(index: index, color: .green.opacity(0.3))
            default:
                viewModel.setRecipeCardColor(index: index, color: .white.opacity(0))
        }
    }
}

//#Preview {
//    RecipeBigView(viewModel: Mock.swipeViewModel, index: 0)
//}

