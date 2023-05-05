//
//  UIViewController+Extension.swift
//  So_Tasty
//
//  Created by apple on 05.05.2023.
//

import UIKit

extension UIViewController {
    
    static var identifire: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifire) as! Self
    }
}
