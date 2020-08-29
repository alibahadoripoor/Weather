//
//  UITextField+Extension.swift
//  Weather
//
//  Created by Ali Bahadori on 28.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

extension UITextField {
    func addPadding(_ padding: CGFloat) {
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        // left
        self.leftView = paddingView
        self.leftViewMode = .always
        
        // right
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
