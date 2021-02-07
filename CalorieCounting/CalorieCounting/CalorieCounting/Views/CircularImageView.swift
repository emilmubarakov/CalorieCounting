//
//  CircularImageView.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 18.12.2020.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureImageView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureImageView()
    }
    
    private func configureImageView() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.coreGray.cgColor
        layer.cornerRadius = bounds.width/2.0
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
}
