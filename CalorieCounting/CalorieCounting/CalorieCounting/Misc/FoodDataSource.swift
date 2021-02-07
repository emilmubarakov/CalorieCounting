//
//  FoodDataSource.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 15.12.2020.
//

import Foundation

typealias TrendPoint = (date: Date, calories: Double)

class FoodDataSource {
    
    static var shared = FoodDataSource()
    
    var allFoods: [Food] {
        return PersistenceManager.shared.retrieveAllFoods().sorted {
            $0.name < $1.name
        }
    }
    
    var allVisibleFoods: [Food] {
        return allFoods.filter({ !$0.isHidden })
    }
    
    var allUconsumedFoods: [Food] {
        return allFoods.filter({ !$0.isConsumedToday })
    }
    
    var todayFoods: [Food] {
        allFoods.filter( {
            if let lastDate = $0.consumptionDates.sorted().last {
                return Calendar.current.isDateInToday(lastDate)
            }
            return false
        })
    }
    
    var totalTodayCalories: Double {
        return todayFoods.compactMap({ $0.calories }).reduce(.zero, +)
    }
    
    var dynamicSevenDayTrend: [TrendPoint] {
        return updatedTrend(sevenDayTrend)
    }
    
    var dynamicThirtyDayTrend: [TrendPoint] {
        return updatedTrend(thirtyDayTrend)
    }
    
    private func updatedTrend(_ trend: [TrendPoint]) -> [TrendPoint] {
        var updatedTrend = trend
        var todayTrendPoint = trend.first
        todayTrendPoint?.calories = totalTodayCalories
        updatedTrend.removeFirst()
        updatedTrend.insert(todayTrendPoint!, at: 0)
        return updatedTrend
    }
    
    private lazy var sevenDayTrend: [TrendPoint] = {
        var trends = [TrendPoint]()
        let dates = getLast(days: 7)
        dates.forEach({ trends.append(($0, totalCalories(for: $0))) })
        return trends
    }()
    
    private lazy var thirtyDayTrend: [TrendPoint] = {
        var trends = [TrendPoint]()
        let dates = getLast(days: 30)
        dates.forEach({ trends.append(($0, totalCalories(for: $0))) })
        return trends
    }()
    
    func totalCalories(for date: Date) -> Double {
        return allFoods(for: date).compactMap({ $0.calories }).reduce(0, +)
    }
    
    func allFoods(for date: Date) -> [Food] {
        var foods = [Food]()
        allFoods.forEach({
            for consumptionDate in $0.consumptionDates {
                if Calendar.current.isDate(consumptionDate, equalTo: date, toGranularity: .day) {
                    foods.append($0)
                }
            }
        })
        return foods
    }
    
    private func getLast(days numberOfDays: Int) -> [Date] {
        let cal = Calendar.current
        let now = cal.startOfDay(for: Date())
        var days = [Date]()
        
        for i in 0 ..< numberOfDays {
            let pastDate = cal.date(byAdding: .day, value: -i, to: now)!
            days.append(pastDate)
        }
        return days
    }
    
    func createNewFoodItem(name: String, calories: Double, imageData: Data) {
        guard let entity = PersistenceManager.shared.entity else { return }
        let food = Food(entity: entity, insertInto: PersistenceManager.shared.conetext)
        food.name = name
        food.calories = calories
        food.imageData = imageData
        food.consumptionDates = []
        PersistenceManager.shared.saveContext()
    }
}
