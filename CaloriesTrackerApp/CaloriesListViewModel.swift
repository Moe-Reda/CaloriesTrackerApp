//
//  CaloriesListViewModel.swift
//  CaloriesTrackerApp
//
//  Created by Mohamed Reda Mahboub on 2023-08-08.
//

import Foundation
import Combine
import Collections

typealias CaloriesGroup = OrderedDictionary<String, [Calories]>
typealias CaloriesPrefixSum = [(String, Double)]
final class CaloriesListViewModel: ObservableObject {
    @Published var calories : [Calories] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getCalories()
    }
    
    func getCalories(){
        guard let url = URL(string: "http://localhost:8080/api/v1/calories") else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{(data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Calories].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink {
                completion in switch completion{
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching calories")
                }
            }
        receiveValue : { [weak self] result in
            self?.calories = result
            dump(self?.$calories)
        }
        .store(in: &cancellables)
    }
    func groupCaloriesByMonth() -> CaloriesGroup{
        guard !calories.isEmpty else {return [:]}
        let groupedCalories = CaloriesGroup(grouping: calories){
            $0.month
        }
        return groupedCalories
    }
    
    func accumulateCalories() -> CaloriesPrefixSum{
        guard !calories.isEmpty else{ return []}
        
        let today = Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        
        var cumulativeSum = CaloriesPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60*60*24){
            let dailyNutrition = calories.filter{$0.dateParsed == date}
            var dailyTotal = 0.0
            for c in dailyNutrition{
                dailyTotal += Double(c.cal)!
            }
            
            cumulativeSum.append((date.formatted(), dailyTotal))
        }
        print(cumulativeSum)
        
        return cumulativeSum
    }
    }
