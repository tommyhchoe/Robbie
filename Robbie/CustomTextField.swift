//
//  CustomTextField.swift
//  Robbie
//
//  Created by Tommy Choe on 12/16/15.
//  Copyright © 2015 Tommy Choe. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 0.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 10.0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10.0, 10.0)
    }
}
