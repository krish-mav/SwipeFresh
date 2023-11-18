//
//  Tag.swift
//  SwipeFresh
//
//  Created by Keaton Nash on 11/18/23.
//

import Foundation

struct Tag: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    enum CodingKeys: String, CodingKey {
            case id
            case name
        }
}
