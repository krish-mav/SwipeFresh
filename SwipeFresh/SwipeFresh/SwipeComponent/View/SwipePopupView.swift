//
//  SwipePopupView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 19.11.23.
//

import SwiftUI

struct SwipePopupView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.8)
                .ignoresSafeArea()
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text("What didn't you like about this recipe?")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Tags")
                        .fontWeight(.semibold)
                    
                    Text("Ingredients")
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                .padding()
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.top, 80)
            .padding(.bottom, 80)
            
            
        }
        
    }
}

#Preview {
    SwipePopupView()
}
