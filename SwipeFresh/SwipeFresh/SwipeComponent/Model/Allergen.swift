//
//  Allergen.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct Allergen: Identifiable {
    var id = UUID()
    var name: String
    init(name: String) {
        self.name = name
    }
    static func == (lhs: Allergen, rhs: Allergen) -> Bool {
        lhs.name == rhs.name
    }
}
