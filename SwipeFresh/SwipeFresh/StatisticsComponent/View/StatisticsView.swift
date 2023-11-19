//
//  StatisticsView.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 19.11.23.
//

import SwiftUI

struct StatisticsView: View {
    var cuisines = ["Italian", "Korean"]
    var hatedCuisines = ["Asian", "Japenese"]
    var hatedIngredients = ["Fish", "Milk"]
    var body: some View {
        HeaderView(title: "Statistics")
        List {
            VStack(alignment: .leading) {
                Text("Favourite cuisine")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack {
                    ForEach(cuisines, id: \.self) { cuisine in
                        ZStack{
                            Rectangle()
                                .stroke(Color.black) // Black border
                                .background(Color.white) // White background
                                .cornerRadius(2)
                                .frame(height: 25)
                            Text("\(cuisine)")
                                .padding(.leading, 10)
                                .padding(.bottom, 5)
                            
                        }
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("Most hated cuisine")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack {
                    ForEach(hatedCuisines, id: \.self) { cuisine in
                        ZStack {
                            Rectangle()
                                .stroke(Color.black) // Black border
                                .background(Color.white) // White background
                                .cornerRadius(3)
                                .frame(height: 25)
                            Text("\(cuisine)")
                                .padding(.leading, 10)
                                .padding(.bottom, 5)
                        }
                    }
                }
            }
            VStack(alignment: .leading) {
                Text("Most hated ingredient")
                    .font(.headline)
                    .padding(.bottom, 5)
                HStack {
                    ForEach(hatedIngredients, id: \.self) { ingredient in
                        ZStack {
                            Rectangle()
                                .stroke(Color.black) // Black border
                                .background(Color.white) // White background
                                .cornerRadius(3)
                                .frame(height: 25)
                            Text("\(ingredient)")
                                .padding(.leading, 10)
                                .padding(.bottom, 5)
                        }
                    }
                }
            }
            HStack(alignment: .top) {
                Text("Food match streak")
                    .font(.headline)
                    .padding(.bottom, 5)
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
            }
        }
    }
}
#Preview {
    StatisticsView()
}
