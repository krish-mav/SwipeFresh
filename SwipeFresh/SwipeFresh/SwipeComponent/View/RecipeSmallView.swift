//
//  RecipeSmallView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct RecipeSmallView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Image("Placeholder")
                .resizable()

            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Text("Recipe name")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(Color("primary"))
                    })
                }
                Text("Tags")
                    
            }
            .padding()
        }
        .cornerRadius(15)
        .padding()
        
    }
}

#Preview {
    RecipeSmallView()
}
