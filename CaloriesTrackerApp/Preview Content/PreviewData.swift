//
//  PreviewData.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-05-29.
//

import Foundation
import SwiftUI

var caloriesPreviewData = Calories(id: "1", date: "07/07/2023", location: "My bedroom", type: "Snack", name: "Hersheys", cal: "120")

var caloriesListPreviewData = [Calories](repeating: caloriesPreviewData, count: 10)
