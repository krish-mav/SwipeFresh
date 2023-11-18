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
    @ObservedObject var viewModel: SwipeViewModel
    var index: Int
    var body: some View {
        ZStack(alignment: .leading) {
                    Image("Placeholder")
                        .resizable()
        VStack(alignment: .leading) {
            Spacer()
            HStack(alignment: .bottom) {
                Text("Recipe name")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                })
            }
            Text("Tags")
                
        }
        .padding()
    }
        .overlay(content: {
            Rectangle()
                .foregroundColor(color)
        })
    .cornerRadius(15)
    .padding()
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
            case -500...(-120):
                color = .red.opacity(0.3)
                
            case 120...(500):
                color = .green.opacity(0.3)
            default:
                color = .white.opacity(0)
        }
    }
        


        
    }


#Preview {
    RecipeSmallView(viewModel: Mock.swipeViewModel, index: 0)
}
