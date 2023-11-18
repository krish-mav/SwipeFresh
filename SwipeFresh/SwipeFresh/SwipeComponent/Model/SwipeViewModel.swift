//
//  SwipeViewModel.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation

class SwipeViewModel: ObservableObject {
    init(recipeStack: [Recipe]) {
        self.recipeStack = recipeStack
    }
    @Published var recipeStack: [Recipe]
    @Published var isShowingBottomSheet: Bool = false
}
