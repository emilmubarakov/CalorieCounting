//
//  Food+CoreDataClass.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 15.12.2020.
//
//

import CoreData

@objc(Food)
public class Food: NSManagedObject {
    
    @NSManaged public var calories: Double
    @NSManaged public var consumptionDates: [Date]
    @NSManaged public var imageData: Data
    @NSManaged public var name: String
    @NSManaged public var isHidden: Bool
    
    public var isConsumedToday: Bool {
        set {
            if newValue == false {
                consumptionDates.removeLast()
            }
            else {
                consumptionDates.append(Date())
            }
            
        }
        get {
            if let lastDate = consumptionDates.last,
                Calendar.current.isDateInToday(lastDate) {
                return true
            }
            return false
        }
    }
}
