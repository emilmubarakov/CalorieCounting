//
//  CircularView.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 18.12.2020.
//

import UIKit

@IBDesignable
class CircularView: UIView {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureView()
    }
    
    private func configureView() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.coreGray.cgColor
        layer.cornerRadius = bounds.width/2.0
        clipsToBounds = true
    }
}
