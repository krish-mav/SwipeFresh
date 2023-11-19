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
    static func < (lhs: AllergenRestriction, rhs: AllergenRestriction) -> Bool {
        lhs.allergen.name == rhs.allergen.name
    }

    init(allergen: Allergen, isSelected: Bool = false) {
        self.allergen = allergen
        self.isSelected = isSelected
    }
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case isSelected
        }
}
