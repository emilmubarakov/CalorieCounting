//
//  FoodTableViewCell.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 20.12.2020.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: CircularImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodCaloriesLabel: UILabel!
    
    override func prepareForReuse() {
        configure(with: nil)
    }
    
    func configure(with food: Food?) {
        foodNameLabel.text = food?.name
        if let food = food {
            foodImageView.image = UIImage(data: food.imageData)
            foodCaloriesLabel.text = String(format: "%.0f", food.calories)
        }
        else {
            foodImageView.image = nil
            foodCaloriesLabel.text = ""
        }
    }
}
