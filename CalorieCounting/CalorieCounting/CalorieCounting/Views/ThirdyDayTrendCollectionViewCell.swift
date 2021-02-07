//
//  ThirdyDayTrendCollectionViewCell.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 29.12.2020.
//

import UIKit

class ThirdyDayTrendCollectionViewCell: TrendCollectionViewCell {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureCell()
    }
    
    private func configureCell() {
        layer.borderColor = UIColor.coreGray.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
