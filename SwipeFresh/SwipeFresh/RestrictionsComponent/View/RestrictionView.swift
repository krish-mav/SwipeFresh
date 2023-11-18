//
//  restrictionView.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation
import SwiftUI


struct RestrictionView: View {
    
    @ObservedObject var viewModel: RestrictionViewModel
    @State private var selectedPreparationTime: Int = 15
    @State private var selectedDiet: String = "None"
    
    var body: some View {
        VStack {
        HeaderView(title: "Food Preferences")
            NavigationStack {
                Form {
                    Section(header: Text("Dietary Preferences")
                        .font(.title3)
                                .foregroundColor(Color("primary_darkest"))
                                .padding(.leading, -15)) {
                        Picker(selection: $selectedDiet, label: Text("Select Dietary Preference")) {
                            Text("None").tag("None")
                            Text("Vegan").tag("Vegan")
                            Text("Vegetarian").tag("Vegetarian")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header: Text("Maximum Preparation Time")
                        .font(.title3)
                                .foregroundColor(Color("primary_darkest"))
                                .padding(.leading, -15)) {
                        Picker(selection: $selectedPreparationTime, label: Text("Select Time")) {
                            ForEach(0..<61, id: \.self) { minute in
                                Text("\(minute * 15) min").tag(minute * 15)
                            }
                        }
                        
                    }
                    Section(header: Text("Allergens")
                        .font(.title3)
                                .foregroundColor(Color("primary_darkest"))
                                .padding(.leading, -15)) {
                        VStack {
                            ForEach(0..<viewModel.allergens.count) { index in
                                HStack {
                                    Text("\(viewModel.allergens[index].name)")
                                    Spacer()
                                    
                                    Image( viewModel.allergens[index].isSelected ? "lime" : "lime-grey")
                                        .resizable()
                                        .frame(width: 25, height: 20)
                                    
                                }
                                .onTapGesture {
                                    viewModel.selectAllergen(index: index)
                                }
                                
                            }
                            
                            HStack {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color("primary_dark"))
                                /*.onTapGesture {
                                 viewModel.addNewAllergen()
                                 }*/
                            }
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

    
#Preview {
    RestrictionView( viewModel: RestrictionViewModel())
}
