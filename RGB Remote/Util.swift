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
        case TextColor
        case BackgroundColor
        case TintColor
        
        func uicolor() -> UIColor {
            switch self {
            case .TextColor, .TintColor:
                return UIColor(hexString: "FFFFFF", withAlpha: 0.66)
//                return UIColor(hexString: "#BABABA")
            case .BackgroundColor:
                return UIColor(hexString: "#333333")
            }
        }
    }
    
}