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
    
    var jsonString = """
        [
            {
                "yield": 2,
                "ingredients": [
                    {
                        "name": "Sirloin Steak",
                        "amount": 12,
                        "unit": "ounce"
                    },
                    {
                        "name": "Rosemary",
                        "amount": 0.25,
                        "unit": "ounce"
                    },
                    {
                        "name": "Parsnip",
                        "amount": 12,
                        "unit": "ounce"
                    },
                    {
                        "name": "Spinach",
                        "amount": 5,
                        "unit": "ounce"
                    },
                    {
                        "name": "Sour Cream",
                        "amount": 2,
                        "unit": "tablespoon"
                    },
                    {
                        "name": "Garlic",
                        "amount": 2,
                        "unit": "clove"
                    },
                    {
                        "name": "Vegetable Oil",
                        "amount": 2,
                        "unit": "teaspoon"
                    },
                    {
                        "name": "Butter",
                        "amount": 2,
                        "unit": "tablespoon"
                    },
                    {
                        "name": "Salt",
                        "amount": null,
                        "unit": "unit"
                    },
                    {
                        "name": "Pepper",
                        "amount": null,
                        "unit": "unit"
                    }
                ]
            },
            {
                "yield": 4,
                "ingredients": [
                    {
                        "name": "Sirloin Steak",
                        "amount": 24,
                        "unit": "ounce"
                    },
                    {
                        "name": "Rosemary",
                        "amount": 0.25,
                        "unit": "ounce"
                    },
                    {
                        "name": "Parsnip",
                        "amount": 18,
                        "unit": "ounce"
                    },
                    {
                        "name": "Spinach",
                        "amount": 10,
                        "unit": "ounce"
                    },
                    {
                        "name": "Sour Cream",
                        "amount": 4,
                        "unit": "tablespoon"
                    },
                    {
                        "name": "Garlic",
                        "amount": 4,
                        "unit": "clove"
                    },
                    {
                        "name": "Vegetable Oil",
                        "amount": 4,
                        "unit": "teaspoon"
                    },
                    {
                        "name": "Butter",
                        "amount": 4,
                        "unit": "tablespoon"
                    },
                    {
                        "name": "Salt",
                        "amount": null,
                        "unit": "unit"
                    },
                    {
                        "name": "Pepper",
                        "amount": null,
                        "unit": "unit"
                    }
                ]
            }
        ]
"""
    
    
    @Published var recipeStack: [RecipeCard] = []
    var recipes: [JsonRecipe] = []
    
    func load() {
        guard let fileURL = Bundle.main.url(forResource: "test1", withExtension: "json") else {
            print("File 'test1.json' not found in bundle.")
            return
        }
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let recipeList = try decoder.decode(RecipeListWrapper.self, from: data)
                let recipes = recipeList.convert()
                self.recipeStack = recipes.map({ RecipeCard(recipe: $0)})
                //let recipes = recipeList.recipes.map { $0.recipe }
                //recipeStack = recipes.map { RecipeCard(recipe: $0) }
                print("Data loaded successfully")
                //print(recipes)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
    }
}
