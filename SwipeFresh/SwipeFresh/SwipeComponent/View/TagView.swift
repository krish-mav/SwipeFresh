//
//  TagView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct TagView: View {
    var tagText: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(35)
                .foregroundColor(.gray)
                .opacity(0.5)
            HStack {
                
                Text(tagText)
            }
            .foregroundColor(.white)
            .padding(7)
        }
        
        .fixedSize()
    }
}

#Preview {
    TagView(tagText: "Really long tag")
}
