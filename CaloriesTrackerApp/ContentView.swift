//
//  ContentView.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-05-29.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var caloriesListVM: CaloriesListViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text ("Overview")
                        .font (.title2)
                        .bold ()
                    
                    let chartData = caloriesListVM.accumulateCalories()
                    CardView {
                        VStack{
                            ChartLabel("This month:", type: .title)
                            BarChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(chartData)
                        .chartStyle(ChartStyle(backgroundColor: Color.background, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height:300)
                    
                    RecentCaloriesList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background (Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image (systemName: "bell.badge")
                        .symbolRenderingMode (.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let caloriesListVM: CaloriesListViewModel = {
        let caloriesListVM = CaloriesListViewModel()
        caloriesListVM.calories = caloriesListPreviewData
        return caloriesListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(caloriesListVM)
    }
}
