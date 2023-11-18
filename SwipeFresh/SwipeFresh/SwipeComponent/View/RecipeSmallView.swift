//
//  RecipeSmallView.swift
//  SwipeFresh
//
//  Created by Julian Kraus on 18.11.23.
//

import SwiftUI

struct RecipeSmallView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .white.opacity(0)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged({gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                })
                .onEnded({ _ in
                    withAnimation {
                        swipe(width: offset.width)
                    }
                })
        )
    }
    func swipe(width: CGFloat) {
        switch width {
            case -500...(-150):
                offset = CGSize(width: -500, height: 0)
            case 150...(500):
                offset = CGSize(width: 500, height: 0)
            default:
                offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
            case -500...(-130):
                color = .red
            case 130...(500):
                color = .green
            default:
                color = .white.opacity(0)
        }
    }

}

#Preview {
    RecipeSmallView()
}
