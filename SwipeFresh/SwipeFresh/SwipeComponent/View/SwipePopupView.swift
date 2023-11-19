//
//  SwipePopupView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 19.11.23.
//

import SwiftUI

struct SwipePopupView: View {
    init(viewModel: SwipeViewModel) {
        self.viewModel = viewModel
        self.ingr = viewModel.learner.wrappedValue.getXLowest(ingredients: viewModel.getRecipe(index: viewModel.lastRecipe ?? viewModel.currentRecipe).ingredientItems.map( { $0.ingredient}), amount: 4)
    }
    let columns = [
               GridItem(.adaptive(minimum: 80))
           ]
    @ObservedObject var viewModel: SwipeViewModel
    @State var selectedElements: [String] = []
    var ingr: [Ingredient]
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.8)
                .ignoresSafeArea()
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text("What didn't you like about this recipe?")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text("Tags")
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.getRecipe(index: viewModel.lastRecipe ?? viewModel.currentRecipe).tags) { tag in

                            Button(action: {
                                if !selectedElements.contains(tag.name) {
                                    selectedElements.append(tag.name)
                                    print(selectedElements)
                                } else {
                                    selectedElements = selectedElements.filter( { $0 != tag.name })
                                    print(selectedElements)
                                }
                            }, label: {
                                TagView(tagText: tag.name, selectedElements: $selectedElements)
                            })
                        }
                    }
                    .padding(8)
                    
                    Text("Ingredients")
                        .fontWeight(.semibold)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(Array(ingr.enumerated()), id: \.0) { index, ingr in

                            Button(action: {
                                if !selectedElements.contains(ingr.name) {
                                    selectedElements.append(ingr.name)
                                    print(selectedElements)
                                } else {
                                    selectedElements = selectedElements.filter( { $0 != ingr.name })
                                    print(selectedElements)
                                }
                            }, label: {
                                TagView(tagText: ingr.name, selectedElements: $selectedElements)
                            })
                        }
                    }
                    .padding(8)
                    Spacer()

                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.numLeft = 0
                        }, label: {
                            Text("Finished")
                        })
                        .buttonStyle(.borderedProminent)
                        .padding()
                        //.background(Color("primary_dark"))
                        Spacer()
                    }
                }
                .padding()
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.top, 80)
            .padding(.bottom, 200)
            
            
        }
        
    }
}

//#Preview {
////    SwipePopupView()
//}
