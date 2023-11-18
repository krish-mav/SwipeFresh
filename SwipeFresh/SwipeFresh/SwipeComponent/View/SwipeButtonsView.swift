//
//  SwipeButtonsView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct SwipeButtonsView: View {
    var body: some View {
        HStack (alignment: .top) {
            Button(action: {}, label: {
                Image(systemName: "arrowshape.turn.up.left.fill")
            })
            Button(action: {}, label: {
                Image(systemName: "xmark")
                    .imageScale(.large)
            })
            Button(action: {}, label: {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
            })
            .imageScale(.large)
            Button(action: {}, label: {
                Image(systemName: "bolt.heart.fill")
            })
        }
    }
}

#Preview {
    SwipeButtonsView()
}
