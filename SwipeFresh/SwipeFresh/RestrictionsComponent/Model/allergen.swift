//
//  Allergen.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

struct Allergen: Identifiable, Comparable, Codable {
    static func < (lhs: Allergen, rhs: Allergen) -> Bool {
        lhs.name == rhs.name
    }
    
    var id = UUID()
    var name: String
    var isSelected: Bool

    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
            case isSelected
        }
}
