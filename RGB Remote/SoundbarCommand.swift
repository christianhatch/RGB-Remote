//
//  SoundbarCommand.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/16/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


enum SoundbarCommand: Command {
    
    case power
    case input
    case volumeUp
    case volumeDown
    case mute
    case left
    case right
    
    static let powerGroup: [SoundbarCommand] = [.power, .input]
    static let mainGroup: [SoundbarCommand] = [.volumeDown, .volumeUp]
}

extension SoundbarCommand {
    
    func displayName() -> String {
        switch self {
        case .power:
            return "Power"
        case .input:
            return "Input"
        case .volumeUp:
            return "Volume Up"
        case .volumeDown:
            return "Volume Down"
        case .mute:
            return "Mute"
        case .left:
            return "Left"
        case .right:
            return "Right"
        }
    }
    
}


extension SoundbarCommand {
    
    func apiKey() -> String {
        switch self {
        case .power:
            return "power"
        case .input:
            return "input"
        case .volumeUp:
            return "volume_up"
        case .volumeDown:
            return "volume_down"
        case .mute:
            return "mute"
        case .left:
            return "left"
        case .right:
            return "right"
        }
    }
    
}

extension SoundbarCommand {
    
    func color() -> XColor {
        switch self {
//        case .power:
//            return "power"
//        case .input:
//            return "input"
//        case .volumeUp:
//            return "volume_up"
//        case .volumeDown:
//            return "volume_down"
//        case .mute:
//            return "mute"
//        case .left:
//            return "left"
//        case .right:
//            return "right"
        default:
            return Style.Color.white.color()
        }
    }
    
}















