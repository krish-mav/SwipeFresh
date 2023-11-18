//
//  Allergen.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

struct Allergen {
    var name: String
    var isSelected: Bool

    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
}
