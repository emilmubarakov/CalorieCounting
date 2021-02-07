//
//  TotalCaloriesView.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 29.12.2020.
//

import UIKit

class TotalCaloriesView: UIView {

    @IBOutlet private var totalCaloriesLabel: LargeLabel!
    @IBOutlet private var dayLabel: UILabel?
    
    var trendPoint: TrendPoint? {
        didSet {
            totalCalories = trendPoint?.calories
            trendDate = trendPoint?.date
        }
    }
    
    var totalCalories: Double? {
        didSet {
            totalCaloriesLabel.text = String(format: "%0.f", totalCalories ?? 0)
        }
    }
    
    private var trendDate: Date? = Date() {
        didSet {
            dayLabel?.text = trendDate?.shortDateString
        }
    }
}
