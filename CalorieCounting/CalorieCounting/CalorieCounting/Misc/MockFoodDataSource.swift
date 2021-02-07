//
//  MockFoodDataSource.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 16.12.2020.
//

import UIKit

class MockFoodDataSource: FoodDataSource {
    
    static let sharedMock = MockFoodDataSource()
    private var randomCalories: Double {
        return Double(arc4random_uniform(UInt32(300)) + 200)
    }
    
    fileprivate var tempMockFoods: [MockFood] {
        var mockFoods = [MockFood]()
        mockFoods.append(MockFood(name: "Mock Breakfast 1",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image01")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 2",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image02")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 3",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image03")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 4",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image04")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 5",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image05")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 6",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image06")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 7",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image07")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 8",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image08")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 9",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image09")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Breakfast 10",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image10")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 1",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image11")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 2",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image12")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 3",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image13")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 4",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image14")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 5",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image15")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 6",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image16")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 7",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image17")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 8",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image18")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 9",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image19")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Lunch 10",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image20")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 1",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image21")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 2",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image22")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 3",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image23")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 4",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image24")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 5",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image25")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 6",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image26")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 7",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image27")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 8",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image28")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 9",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image29")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))
        mockFoods.append(MockFood(name: "Mock Dinner 10",
                                  calories: randomCalories,
                                  imageData: (UIImage(named: "image30")?.jpegData(compressionQuality: 10))!,
                                  consumptionDates: Date.randomeDates))

        return mockFoods
    }
    
    func createMockData() {
        guard let entity = PersistenceManager.shared.entity else { return }
        tempMockFoods.forEach({
            let food = Food(entity: entity, insertInto: PersistenceManager.shared.conetext)
            food.name = $0.name
            food.calories = $0.calories
            food.imageData = $0.imageData
            food.consumptionDates = $0.consumptionDates
        })
        PersistenceManager.shared.saveContext()
    }
    
    func destroyMockData() {
        allFoods.filter({ $0.name.contains("Mock")}).forEach({ PersistenceManager.shared.delete($0) })
    }
}

private struct MockFood {
    let name: String
    let calories: Double
    let imageData: Data
    let consumptionDates: [Date]
}

private extension Date {
    static var randomeDates: [Date] {
        var dates = [Date]()
        for _ in 1 ... 5 {
            let randomDay = Int(arc4random_uniform(UInt32(30)))
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            let randomDate = Calendar.current.date(byAdding: .day, value: -randomDay, to: yesterday)!
            dates.append(randomDate)
        }
        return dates
    }
}
