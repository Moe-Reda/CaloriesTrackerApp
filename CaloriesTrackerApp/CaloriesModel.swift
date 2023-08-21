//
//  CaloriesModel.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-05-29.
//

import Foundation
import SwiftUIFontIcon

struct Calories: Identifiable, Decodable{
    let id: String
    let date: String
    let location: String
    let type: String
    let name: String
    let cal: String
    var dateParsed: Date {
        date.dateParsed()
    }
    var icon: FontAwesomeCode {
        if let category = Category.categories.first(where: {$0.name == type}){
            return category.icon
        }
        return .question
    }
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
}
    
extension Category{
    static let snack = Category(id: 1, name: "Snack", icon: .cookie)
    static let breakfast = Category(id: 2, name: "Breakfast", icon: .bread_slice)
    static let lunch = Category(id: 3, name: "Lunch", icon: .hamburger)
    static let dinner = Category(id: 4, name: "Dinner", icon: .drumstick_bite)
    static let beverage = Category(id: 5, name: "Beverage", icon: .wine_glass)
}

extension Category{
    static let categories: [Category] = [
        .snack,
        .breakfast,
        .lunch,
        .dinner,
        .beverage
    ]
}
