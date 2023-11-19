//
//  Ingredient.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    var id = UUID()
    var name: String
    var unit: String?

    init(name: String, unit: String?) {
        self.name = name
        self.unit = unit
    }
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case unit
    }
}
