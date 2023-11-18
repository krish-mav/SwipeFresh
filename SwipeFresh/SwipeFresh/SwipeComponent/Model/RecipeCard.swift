//
//  RecipeCard.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import Foundation
import SwiftUI

struct RecipeCard {
    var recipe: Recipe
    var offset: CGSize = .zero
    var color: Color = .white.opacity(0)
    var liked: Int = 0
}
