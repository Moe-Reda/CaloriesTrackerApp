//
//  RecentCaloriesList.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-08-09.
//

import SwiftUI

struct RecentCaloriesList: View {
    @EnvironmentObject var caloriesListVM: CaloriesListViewModel
    var body: some View {
        VStack{
            HStack(spacing: 70){
                Text("Recent Calories Consumed:")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    CaloriesList()
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(caloriesListVM.calories.prefix(5)) {
                calorie in CaloriesRow(Calories: calorie)
                Divider()
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentCaloriesList_Previews: PreviewProvider {
    static let caloriesListVM: CaloriesListViewModel = {
        let caloriesListVM = CaloriesListViewModel()
        caloriesListVM.calories = caloriesListPreviewData
        return caloriesListVM
    }()
    static var previews: some View {
        RecentCaloriesList()
            .environmentObject(caloriesListVM)
    }
}
