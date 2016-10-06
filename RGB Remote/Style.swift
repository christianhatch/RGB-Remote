//
//  Style.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

#if os(macOS)
    import Cocoa
    typealias XColor = NSColor
#else
    import UIKit
    typealias XColor = UIColor
#endif



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
        
        func color() -> XColor {
            switch self {
            case .textColor, .tintColor:
                return Style.Color.white.color().withAlphaComponent(0.66)
            case .backgroundColor:
                return XColor.hsb(h: 0, s: 0, b: 20)
            case .darkGray:
                return XColor.hsb(h: 0, s: 0, b: 35)
                
            case .red:
                return XColor.hsb(h: 6, s: 74, b: 91)
            case .green:
                return XColor.hsb(h: 145, s: 77, b: 80)
            case .blue:
                return XColor.hsb(h: 224, s: 50, b: 63)
            case .white:
                return XColor.hsb(h: 192, s: 2, b: 95)
            case .yellow:
                return XColor.hsb(h: 48, s: 99, b: 100)
            case .orange:
                return XColor.hsb(h: 28, s: 85, b: 90)
            case .powderBlue:
                return XColor.hsb(h: 222, s: 24, b: 95)
            case .purple:
                return XColor.hsb(h: 253, s: 52, b: 77)
            case .teal:
                return XColor.hsb(h: 195, s: 55, b: 51)
            case .pink:
                return XColor.hsb(h: 324, s: 49, b: 96)
            }
        }
    }
}


extension XColor {
    
    static func hsb(h: CGFloat, s: CGFloat, b: CGFloat) -> XColor {
        return XColor(hue: h/360, saturation: s/100, brightness: b/100, alpha: 1)
    }
    
    func darken(byPercentage percentage: CGFloat) -> XColor? {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        #if os(iOS)
            //Check if HSBA values exist
            guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return nil }
        #else
            getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        #endif

        //Make sure our percentage is greater than 0
        if percentage > 0 {
            b = min(b - percentage, 1.0)
        }
        //Return darker color
        return XColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
    
    func lighten(byPercentage percentage: CGFloat) -> XColor? {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        #if os(iOS)
            //Check if HSBA values exist
            guard getHue(&h, saturation: &s, brightness: &b, alpha: &a) else { return nil }
        #else
            getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        #endif
        
        //Make sure our percentage is greater than 0
        if percentage > 0 {
            b = min(b + percentage, 1.0)
        }
        //Return lighter color
        return XColor(hue: h, saturation: s, brightness: b, alpha: a)
    }
}











