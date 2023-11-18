//
//  restrictionViewModel.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

class restrictionViewModel: ObservableObject {
    init(allergens: [Allergen] = Mock.allergens) {
        self.allergens = allergens
    }
    @Published var allergens: [Allergen]
    
    func selectAllergen(index: Int) {
        allergens[index].isSelected.toggle()
    }
}
