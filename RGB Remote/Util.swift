//
//  Util.swift
//  RGB Remote
//
//  Created by Christian Hatch on 2/9/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

enum Style {
    enum Color {
        case textColor
        case backgroundColor
        case tintColor
        
        func uicolor() -> UIColor {
            switch self {
            case .textColor, .tintColor:
                return UIColor(hexString: "FFFFFF", withAlpha: 0.66)
            case .backgroundColor:
                return UIColor(hexString: "#333333")
            }
        }
    }
    
}




class RGBNavigationController: UINavigationController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}




