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
            case .BackgroundColor:
                return UIColor(hexString: "#333333")
            }
        }
    }
    
}


extension UIColor {
    
//    convenience init(hexString: String, withAlpha: CGFloat? = 1.0) {
//        var red:   CGFloat = 0.0
//        var green: CGFloat = 0.0
//        var blue:  CGFloat = 0.0
//        var alpha: CGFloat = withAlpha ?? 1.0
//        
//        if hexString.hasPrefix("#") {
//            let index   = hexString.startIndex.advancedBy(1)
//            let hex     = hexString.substringFromIndex(index)
//            let scanner = NSScanner(string: hex)
//            var hexValue: CUnsignedLongLong = 0
//            if scanner.scanHexLongLong(&hexValue) {
//                switch (hex.characters.count) {
//                case 3:
//                    red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
//                    green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
//                    blue  = CGFloat(hexValue & 0x00F)              / 15.0
//                case 4:
//                    red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
//                    green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
//                    blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
//                    alpha = CGFloat(hexValue & 0x000F)             / 15.0
//                case 6:
//                    red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
//                    green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
//                    blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
//                case 8:
//                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
//                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
//                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
//                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
//                default:
//                    print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
//                }
//            } else {
//                print("Scan hex error")
//            }
//        } else {
//            print("Invalid RGB string, missing '#' as prefix", terminator: "")
//        }
//        self.init(red:red, green:green, blue:blue, alpha:alpha)
//    }
    
//    func darkenByPercentage(percentage: CGFloat) -> UIColor? {
//        //Define HSBA values
//        var h: CGFloat = 0
//        var s: CGFloat = 0
//        var b: CGFloat = 0
//        var a: CGFloat = 0
//        //Check if HSBA values exist
//        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
//            //Make sure our percentage is greater than 0
//            if percentage > 0 {
//                b = min(b - percentage, 1.0)
//            }
//            //Return darker color
//            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
//        }
//        return nil
//    }
//    
//    func lightenByPercentage(percentage: CGFloat) -> UIColor? {
//        //Define HSBA values
//        var h: CGFloat = 0
//        var s: CGFloat = 0
//        var b: CGFloat = 0
//        var a: CGFloat = 0
//        //Check if HSBA values exist
//        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
//            //Make sure our percentage is greater than 0
//            if percentage > 0 {
//                b = min(b + percentage, 1.0)
//            }
//            //Return lighter color
//            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
//        }
//        return nil
//    }
}



class RGBNavigationController: UINavigationController {
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}




