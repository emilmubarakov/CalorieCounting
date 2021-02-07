//
//  Constants.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 15.12.2020.
//

import Foundation

struct Constant {
    
    struct Alert {
        
        struct Title {
            static let attention = "You are about to permanently delete a food from your list"
            static let createMockData = "Would you like to add some mock data to the app?"
            static let destroyMockData = "Would you like DELETE all the mock data from the app?"
            static let duplicateEntry = "The food name you are trying to save already exists in your list of foods."
            
            struct Action {
                static let cancel = "Cancel"
                static let ok = "Okay"
                static let addFoodToToday = "Add Food to Today"
                static let editFood = "Edit Food"
                static let deleteFood = "Delete Food"
                static let delete = "Delete"
                static let fromPhotoLibrary = "From Photo Library"
                static let usingCamera = "Using Camera"
            }
        }
        
        struct Message {
            static let photoSelection = "How would you like to add a photo?"
            static let makeSelection = "Please make your selection."
            static let changeFoodName = "Please enter a different food name."
        }
    }
    
    struct ButtonTitle {
        static let change = "Change"
    }
    
    struct Identifier {
        
        struct Segue {
            static let toNewFood = "toNewFood"
            static let toFoods = "toFoods"
            static let toToday = "toToday"
            static let toChart = "toChart"
        }
        
        struct Cell {
            static let foodCell = "foodCell"
            static let foodCellNib = "FoodTableViewCell"
            static let todayCell = "todayCell"
            static let trendLargeCell = "trendLargeCell"
            static let trendSmallCell = "trendSmallCell"
        }
    }
    
    struct ImageName {
        static let placeholder = "placeholder"
    }
    
    struct Persistence {
        static let contextName = "CalorieTracker"
        static let entityName = "Food"
    }
}
