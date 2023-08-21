//
//  CaloriesList.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-08-15.
//

import SwiftUI

struct CaloriesList: View {
    @EnvironmentObject var caloriesListVM: CaloriesListViewModel
    var body: some View {
        VStack{
            List{
                ForEach(Array(caloriesListVM.groupCaloriesByMonth()), id: \.key){
                    month, calories in
                    Section {
                        ForEach(calories){
                            calorie in CaloriesRow(Calories: calorie)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Calories")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CaloriesList_Previews: PreviewProvider {
    static let caloriesListVM: CaloriesListViewModel = {
        let caloriesListVM = CaloriesListViewModel()
        caloriesListVM.calories = caloriesListPreviewData
        return caloriesListVM
    }()
    static var previews: some View {
        NavigationView {
            CaloriesList()
                .environmentObject(caloriesListVM)
        }
    }
}
