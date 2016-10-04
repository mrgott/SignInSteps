//
//  TextFieldExtension.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 10/2/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class TextFieldPadding: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }
    
    
}
