//
//  Dataloader.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation
import SwiftUI

class Dataloader: ObservableObject {
    init() {
        self.load()
    }
    
    @Published var recipeStack: [RecipeCard] = []
    var recipes: [Recipe] = []
    
    func load() {
        guard let fileURL = Bundle.main.url(forResource: "test1", withExtension: "json") else {
            print("File 'test1.json' not found in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            recipes = try decoder.decode([Recipe].self, from: data)
            recipeStack = recipes.map { RecipeCard(recipe: $0) }
            print("Data loaded successfully")
            print(recipeStack)
        } catch {
            print("Error loading data: \(error.localizedDescription)")
        }
    }
}
