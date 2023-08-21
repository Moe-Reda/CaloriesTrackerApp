//
//  CaloriesTrackerAppApp.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-05-29.
//

import SwiftUI

@main
struct CaloriesTrackerAppApp: App {
    @StateObject var CaloriesListVM = CaloriesListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CaloriesListVM)
        }
    }
}
