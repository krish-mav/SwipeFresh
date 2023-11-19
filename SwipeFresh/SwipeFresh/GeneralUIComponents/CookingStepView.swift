//
//  CookingStepView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct CookingStepView: View {
    var number: Int
    var text: String
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                    .frame(width: 60, height: 60)
                Text("\(number)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)

                
            }
           
            Text(text)
                .padding()
        }
        
    }
}

#Preview {
    CookingStepView(number: 1, text: "This is a really long instruction")
}
