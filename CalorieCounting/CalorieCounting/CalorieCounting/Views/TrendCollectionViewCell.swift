//
//  TrendCollectionViewCell.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 29.12.2020.
//

import UIKit

class TrendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var totalCaloriesView: TotalCaloriesView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: nil)
    }
    
    func configure(with trendPoint: TrendPoint?) {
        totalCaloriesView.trendPoint = trendPoint
    }
}
