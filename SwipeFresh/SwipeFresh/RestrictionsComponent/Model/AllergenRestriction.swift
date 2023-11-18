//
//  Allergen.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

struct AllergenRestriction {
    var allergen: Allergen
    var isSelected: Bool

    init(allergen: Allergen, isSelected: Bool = false) {
        self.allergen = allergen
        self.isSelected = isSelected
    }
}
