//
//  RecipeBigView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI
//        Image with url
//        Name
//        Ingredients
//        Tags
//        Prep time
//        Instructions
//        ...Time

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
                                Text("Recipe name")
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
                                        .foregroundColor(Color("primary_dark"))
                                        .font(.largeTitle)
                                })
                                
                            }
//                            TODO: Make an HStack that moves things in multiple rows when too many
                            HStack {
                                TagView()
                                TagView()
                                TagView()
                                
                            }
                            HStack {
                                TimeTagRecipeView()
                                    .padding(.trailing)
                                TimeTagRecipeView()
                            }
                            
                            Spacer().frame(height: 20)
                            Text("Ingredients")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer().frame(height: 50)
                            Text("Instructions")
                                .font(.title)
                                .fontWeight(.bold)
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

