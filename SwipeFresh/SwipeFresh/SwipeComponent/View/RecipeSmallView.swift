//
//  RecipeSmallView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct RecipeSmallView: View {
    @State private var offset = CGSize.zero
    let columns = [
               GridItem(.adaptive(minimum: 90))
           ]
    @State private var color: Color = .white.opacity(0)
    @ObservedObject var viewModel: SwipeViewModel
    var index: Int
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                AsyncImage(url: URL(string: viewModel.getRecipe(index: index).image), transaction: Transaction(animation: .spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5))) { phase in
                    switch phase {
                    case .empty:
                        Color("primary_darkest")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 370, height: 600)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 370, height: 600)
                    case .failure(_):
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 370, height: 600)
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }

                LinearGradient(colors: [Color.black.opacity(0.9), Color.clear], startPoint: .bottom, endPoint:.center)

                VStack(alignment: .leading) {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text("\(viewModel.getRecipe(index: index).name)")
                            .font(Font.custom("Agrandir-TextBold", size: 30))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Button(action: {
                                viewModel.isShowingBottomSheet.toggle()
                        }, label: {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        })
                    }
                    
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(viewModel.getRecipe(index: index).tags) { tag in
                            TagView(tagText: tag.name)
                        }
                        
                    }
                   
                    
                }
                .padding()
                
            }
        }
        .overlay(content: {
            Rectangle()
                .foregroundColor(viewModel.getRecipeCard(index: index).color)
        })
        .onChange(of: viewModel.getRecipeCard(index: index).liked, { oldValue, newValue in
            if newValue == 1 {
                withAnimation(Animation.easeInOut(duration: 1.0)) {
                    viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 900, height: 0))
                    changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                    viewModel.currentRecipe = index + 1
                    viewModel.lastRecipe = index
                }

            } else if newValue == 3 {
                withAnimation(Animation.snappy(duration: 2.0)) {
                    viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 0, height: -6000))
                    changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                    viewModel.currentRecipe = index + 1
                    viewModel.lastRecipe = index
                }
                
            } else if newValue == -1 {
                withAnimation(Animation.easeInOut(duration: 1.0)) {
                    viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: -900, height: 0))
                    changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                    viewModel.currentRecipe = index + 1
                    viewModel.lastRecipe = index
                    
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

    .cornerRadius(15)
    .padding()
    .offset(x: viewModel.getRecipeCard(index: index).offset.width, y: viewModel.getRecipeCard(index: index).offset.height * 0.2)
    .rotationEffect(.degrees(Double(viewModel.getRecipeCard(index: index).offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged({gesture in
                    viewModel.setRecipeCardOffset(index: index, offset: gesture.translation)
                    withAnimation {
                        changeColor(width: viewModel.getRecipeCard(index: index).offset.width)
                    }
                })
                .onEnded({ _ in
                    withAnimation {
                        swipe(width: viewModel.getRecipeCard(index: index).offset.width)
                    }
                })
        )
    }
    func swipe(width: CGFloat) {
        switch width {

            case -500...(-150):
                viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: -900, height: 0))
                viewModel.lastRecipe = index
                viewModel.currentRecipe = index + 1
                viewModel.dislikeRecipe(index: index)
                viewModel.learn(card: viewModel.getRecipeCard(index: index))
            case 150...(500):
                viewModel.setRecipeCardOffset(index: index, offset: CGSize(width: 900, height: 0))
                viewModel.lastRecipe = index
                viewModel.currentRecipe = index + 1
                viewModel.likeRecipe(index: index)
                viewModel.learner.wrappedValue.learn(card: viewModel.getRecipeCard(index: index))
            default:
                viewModel.setRecipeCardOffset(index: index, offset: .zero)
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


/*#Preview {
 RecipeSmallView(viewModel: Mock.swipeViewModel, index: 0)
 }
 */
