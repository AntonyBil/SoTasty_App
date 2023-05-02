//
//  UIView+Extension.swift
//  So_Tasty
//
//  Created by apple on 02.05.2023.
//

import UIKit

//Corner Radius
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
