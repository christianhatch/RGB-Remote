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
        case tintColor
        case backgroundColor
        case darkGray
        
        case red
        case green
        case blue
        case white
        case yellow
        case orange
        case powderBlue
        case purple
        case teal
        case pink
        
        func color() -> UIColor {
            switch self {
            case .textColor, .tintColor:
                return Style.Color.white.color().withAlphaComponent(0.66)
            case .backgroundColor:
                return UIColor.hsb(h: 0, s: 0, b: 20)
            case .darkGray:
                return UIColor.hsb(h: 0, s: 0, b: 35)
            
            case .red:
                return UIColor.hsb(h: 6, s: 74, b: 91)
            case .green:
                return UIColor.hsb(h: 145, s: 77, b: 80)
            case .blue:
                return UIColor.hsb(h: 224, s: 50, b: 63)
            case .white:
                return UIColor.hsb(h: 192, s: 2, b: 95)
            case .yellow:
                return UIColor.hsb(h: 48, s: 99, b: 100)
            case .orange:
                return UIColor.hsb(h: 28, s: 85, b: 90)
            case .powderBlue:
                return UIColor.hsb(h: 222, s: 24, b: 95)
            case .purple:
                return UIColor.hsb(h: 253, s: 52, b: 77)
            case .teal:
                return UIColor.hsb(h: 195, s: 55, b: 51)
            case .pink:
                return UIColor.hsb(h: 324, s: 49, b: 96)
            }
        }
    }
}


extension UIColor {
    
    static func hsb(h: CGFloat, s: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(hue: h/360, saturation: s/100, brightness: b/100, alpha: 1)
    }
    
    func darken(byPercentage percentage: CGFloat) -> UIColor? {
        //Define HSBA values
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        //Check if HSBA values exist
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            //Make sure our percentage is greater than 0
            if percentage > 0 {
                b = min(b - percentage, 1.0)
            }
            //Return darker color
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return nil
    }
    
    func lighten(byPercentage percentage: CGFloat) -> UIColor? {
        //Define HSBA values
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        //Check if HSBA values exist
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            //Make sure our percentage is greater than 0
            if percentage > 0 {
                b = min(b + percentage, 1.0)
            }
            //Return lighter color
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return nil
    }
}


class RGBNavigationController: UINavigationController {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}




