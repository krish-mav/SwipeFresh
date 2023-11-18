//
//  TimeTagRecipeView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct TimeTagRecipeView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(Color("primary"))
            HStack {
                Image(systemName: "clock")
                Text("45 min")
            }
            .foregroundColor(.white)
            .padding()
        }
        
        .fixedSize()
    }
}

#Preview {
    TimeTagRecipeView()
}
