//
//  ProjectorCommand.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/16/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

enum ProjectorCommand: Command {
    
    case power
    case zoom
    case hide
    case aspectRatio
    case colorSetting

    case menu
    case enter
    case up
    case down
    case left
    case right

    case volumeUp
    case volumeDown
    
    case media
    case hdmi
    case video
    case sVideo
    case vga
    
    
    static let powerGroup: [ProjectorCommand] = [.power, .media]
    static let mainGroup: [ProjectorCommand] = [.hdmi, .video]
    
    static let inputGroup: [ProjectorCommand] = [.media, .hdmi, .sVideo, .vga]
    static let menuGroup: [ProjectorCommand] = [.menu, .enter, .up, .down, .left, .right]

    
    func displayName() -> String {
        switch self {
            
        case .power:
            return "Power"
        case .zoom:
            return "Zoom"
        case .hide:
            return "Hide"
            
        case .menu:
            return "Menu"
        case .enter:
            return "Enter"
        case .up:
            return "Up"
        case .down:
            return "Down"
        case .left:
            return "Left"
        case .right:
            return "Right"
            
        case .aspectRatio:
            return "Aspect Ratio"
        case .colorSetting:
            return "Color"
            
        case .volumeUp:
            return "Volume Up"
        case .volumeDown:
            return "Volume Down"

        case .media:
            return "Media"
        case .hdmi:
            return "HDMI"
        case .video:
            return "Video"
        case .sVideo:
            return "S-Video"
        case .vga:
            return "VGA"
        }
    }
    
    
    func apiKey() -> String {
        switch self {
            
        case .power:
            return "power"
        case .zoom:
            return "zoom"
        case .hide:
            return "hide"
            
        case .menu:
            return "menu"
        case .enter:
            return "enter"
        case .up:
            return "up"
        case .down:
            return "down"
        case .left:
            return "left"
        case .right:
            return "right"
            
        case .aspectRatio:
            return "aspect_ratio"
        case .colorSetting:
            return "color"
            
        case .volumeUp:
            return "volume_up"
        case .volumeDown:
            return "volume_down"
            
        case .media:
            return "media"
        case .hdmi:
            return "hdmi"
        case .video:
            return "video"
        case .sVideo:
            return "s_video"
        case .vga:
            return "vga"
        }
    }
    
    
    func color() -> XColor {
        switch self {
        default:
            return Style.Color.white.color()
        }
    }
    
}













