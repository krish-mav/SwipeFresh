//
//  TagView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct TagView: View {
    var tagText: String
    var selectedElements: Binding<[String]>? = nil
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(35)
                .foregroundColor((selectedElements?.wrappedValue.contains(tagText) ?? false) ? Color("primary").opacity(0.8) : .gray.opacity(0.5))
                
            HStack {
                
                Text(tagText)
                    .frame(width: 90)
                    .font(.subheadline)
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
