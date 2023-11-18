//
//  Allergen.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

struct Allergen: Identifiable {
    var id = UUID()
    var name: String
    var isSelected: Bool

    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}
