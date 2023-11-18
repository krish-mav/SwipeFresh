//
//  TimeTagRecipeView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct TimeTagRecipeView: View {
    var iconName: String
    var text: String
    var title: String
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .cornerRadius(15)
                .foregroundColor(Color("primary"))
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: iconName)
                    Text(text)
                }
                .foregroundColor(.white)
                
            }
            .padding()
        }
        
        .fixedSize()
    }
}

#Preview {
    TimeTagRecipeView(iconName: "clock", text: "45 min", title: "Prep")
}
