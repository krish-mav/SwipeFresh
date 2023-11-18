//
//  restrictionView.swift
//  SwipeFresh
//
//  Created by Krishna Mavani on 18.11.23.
//

import Foundation
import SwiftUI

struct restrictionView: View {
    
    @ObservedObject var viewModel: restrictionViewModel
    @State private var selectedPreparationTime: Int = 15
    @State private var selectedDiet: String = "None"
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Dietary Preferences")) {
                    Picker(selection: $selectedDiet, label: Text("Select Dietary Preference")) {
                        Text("None").tag("None")
                        Text("Vegan").tag("Vegan")
                        Text("Vegetarian").tag("Vegetarian")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Maximum Preparation Time")) {
                                    Picker(selection: $selectedPreparationTime, label: Text("Select Time")) {
                                        ForEach(0..<61, id: \.self) { minute in
                                            Text("\(minute * 15) min").tag(minute * 15)
                                        }
                                    }
                                }
                Section(header: Text("Allergens")) {
                    VStack {
                        ForEach(0..<viewModel.allergenRestrictions.count) { index in
                            HStack {
                                Text("\(viewModel.allergenRestrictions[index].allergen.name)")
                                Spacer()
                                
                                Image( viewModel.allergenRestrictions[index].isSelected ? "lime" : "lime-grey")
                                    .resizable()
                                    .frame(width: 25, height: 20)
                                
                            }
                            .onTapGesture {
                                viewModel.selectAllergen(index: index)
                            }
                            
                        }
                        .navigationTitle("Food Preferences")
                        HStack {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.secondary)
                                /*.onTapGesture {
                                    viewModel.addNewAllergen()
                                }*/
                        }
                    }
                }
            }
        }
    }
}

    
#Preview {
    restrictionView( viewModel: restrictionViewModel())
}
