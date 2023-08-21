//
//  CaloriesRow.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-05-29.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon

struct CaloriesRow: View {
    var Calories : Calories
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: Calories.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6){
                Text(Calories.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(Calories.type)
                    .font(.footnote)
                    .bold()
                    .lineLimit(21)
                Text(Calories.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(Calories.cal + " Cal")
        }
        .padding([.top, .bottom], 8)
    }
}

struct SleepRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CaloriesRow(Calories: caloriesPreviewData)
            CaloriesRow(Calories: caloriesPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
