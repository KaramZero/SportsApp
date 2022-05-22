//
//  CardView.swift
//  SportsApp
//
//  Created by Nour Gweda on 5/21/22.
//  Copyright © 2022 Karam Ibrahim. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardView : UIView {
@IBInspectable    var cornerRadius : CGFloat = 25
    var ofseWidth : CGFloat = 2
    var ofseHeigth : CGFloat = 2
    
    
    var ofseshadowopacity : Float = 5
    var color  = UIColor.systemGray4
    
    override func layoutSubviews() {
        layer.shadowColor = self.color.cgColor
        layer.shadowOffset = CGSize(width:5, height: 5)
        layer.shadowPath = UIBezierPath(roundedRect: bounds,cornerRadius: self.cornerRadius).cgPath
        layer.cornerRadius = self.cornerRadius
        layer.shadowOpacity = self.ofseshadowopacity
        
    }
}
