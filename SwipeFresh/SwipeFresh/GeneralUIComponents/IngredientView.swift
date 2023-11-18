//
//  IngredientView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: String
    var unit: String
    var quantity: String
    var body: some View {
        HStack {
            Text(ingredient)
            Spacer()
            Text(quantity + " " + unit)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    IngredientView(ingredient: "3", unit: "3", quantity: "3")
}
