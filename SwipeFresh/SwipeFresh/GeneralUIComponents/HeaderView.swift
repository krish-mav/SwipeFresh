//
//  HeaderView.swift
//  SwipeFresh
//
//  Created by Aleksandra Topalova on 18.11.23.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("primary_darkest"))
                    .ignoresSafeArea()
                
                Text(title)
                    .font(Font.custom("Agrandir-Regular", size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .fontWeight(.bold)
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        Spacer()
    }
    
}


#Preview {
    HeaderView(title: "Placeholder Title")
}
