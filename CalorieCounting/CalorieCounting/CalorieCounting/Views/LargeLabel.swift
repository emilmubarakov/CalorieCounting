//
//  LargeLabel.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 21.12.2020.
//

import UIKit

@IBDesignable
class LargeLabel: UILabel {
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        configureLabel()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureLabel()
    }

    private func configureLabel() {
        textColor = .coreGray
        font = UIFont.systemFont(ofSize: 40, weight: .ultraLight)
    }
}
