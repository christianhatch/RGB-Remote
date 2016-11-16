//
//  HDMISwitchCommand.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/16/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


enum HDMISwitchCommand: Command {
    
    case power
    case one
    case two
    case three
    
    case twoChannelAudio
    case surroundSound
    
    case pass
    case spdif
    case arc
    case auto
    
    static let powerGroup: [HDMISwitchCommand] = [.power]
    static let mainGroup: [HDMISwitchCommand] = [.one, .two, .three]
    
//    static let input: [HDMISwitchCommand] = [.one, .two, .three]
}

extension HDMISwitchCommand {
    
    func displayName() -> String {
        switch self {
        case .power:
            return "Power"
        case .one:
            return "Input 1"
        case .two:
            return "Input 2"
        case .three:
            return "Input 3"
        case .twoChannelAudio:
            return "2.1 Audio"
        case .surroundSound:
            return "5.1 Audio"
        case .pass:
            return "Pass"
        case .spdif:
            return "SPDIF/LR"
        case .arc:
            return "ARC"
        case .auto:
            return "Auto"
        }
    }
    
}


extension HDMISwitchCommand {
    
    func apiKey() -> String {
        switch self {
        case .power:
            return "power"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .twoChannelAudio:
            return "2_ch"
        case .surroundSound:
            return "51_ch"
        case .pass:
            return "pass"
        case .spdif:
            return "spdif"
        case .arc:
            return "arc"
        case .auto:
            return "auto"
        }
    }
    
}

extension HDMISwitchCommand {
    
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



