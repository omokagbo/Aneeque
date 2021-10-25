//
//  UIView+Extension.swift
//  HaggleX
//
//  Created by Emmanuel Omokagbo on 20/10/2021.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    public func createCardView(viewName: UIView) {
       viewName.backgroundColor = .white
       viewName.layer.cornerRadius = 20.0
       viewName.layer.shadowColor = UIColor.systemGray3.cgColor
       viewName.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
       viewName.layer.shadowRadius = 6.0
       viewName.layer.shadowOpacity = 0.7
   }
    
}
