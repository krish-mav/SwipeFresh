//
//  restrictionViewModel.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation

class RestrictionViewModel: ObservableObject {
    init(allergenRestrictions: [AllergenRestriction] = Mock.allergenRestrictions) {
        self.allergenRestrictions = allergenRestrictions
    }
    @Published var allergenRestrictions: [AllergenRestriction]
    
    func selectAllergen(index: Int) {
        allergenRestrictions[index].isSelected.toggle()

    }
}
