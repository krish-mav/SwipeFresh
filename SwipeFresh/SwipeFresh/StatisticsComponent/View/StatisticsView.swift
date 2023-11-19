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
        VStack {
            HeaderView(title: "Statistics")
            List {
                VStack(alignment: .leading) {
                    Text("Favourite cuisine")
                        .font(.headline)
                        .padding(.bottom, 5)
                    HStack {
                        ForEach(cuisines, id: \.self) { cuisine in
                            ZStack{
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.black) // Black border
                                    .background(Color.white) // White background
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
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.black) // Black border
                                    .background(Color.white) // White background
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
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.black) // Black border
                                    //.background(Color.white) // White background
                                    .frame(height: 25)
                                Text("\(ingredient)")
                                    .padding(.leading, 10)
                                    .padding(.bottom, 5)
                            }
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("Swipe Stats")
                        .font(.headline)
                        .padding(.bottom, 5)
                    HStack(alignment: .top) {
                        Text("Food match streak")
                            .font(.body)
                            .padding(.bottom, 5)
                        Spacer()
                        Text("\(5)")
                        Image("lime")
                            .resizable()
                            .frame(width: 25, height: 20)
                    }
                    HStack(alignment: .top) {
                        Text("Right-Swipe-Percentage")
                            .font(.body)
                            .padding(.bottom, 5)
                        Spacer()
                        Text("72%")
                    }
                }

            }
        }
    }
}
#Preview {
    StatisticsView()
}
