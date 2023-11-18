//
//  Ingredient.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var unit: Unit?

    init(name: String, unit: Unit?) {
        self.name = name
        self.unit = unit
    }
}
