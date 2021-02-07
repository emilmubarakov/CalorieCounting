//
//  WhiteButton.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 29.12.2020.
//

import UIKit

@IBDesignable
class WhiteButton: UIButton {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureButton()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureButton()
    }
    
    private func configureButton() {
        tintColor = .coreBlue
        backgroundColor = .white
        alpha = 0.75
    }
}
