//
//  IRRemoteControl.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/15/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


struct Section {
    let itemsPerRow: CGFloat
    let items: [Command]
}

enum IRDeviceType: String {
    case rgb
    case rgbww
    case projector
    case hdmiSwitch
    case soundbar
    
    func apiName() -> String {
        switch self {
        case .hdmiSwitch:
            return "hdmi_switch"
        default:
            return rawValue
        }
    }
}

protocol IRRemoteControl {
    var sections: [Section] { get }
    var device: IRDeviceType { get }
}




//MARK: - RemoteControl

class RGBRemoteControl: IRRemoteControl {
    
    let sections: [Section] = [Section(itemsPerRow: 4, items: RGBCommand.effects),
                               Section(itemsPerRow: 4, items: RGBCommand.rgbColors),
                               Section(itemsPerRow: 4, items: RGBCommand.rgbControls),
                               Section(itemsPerRow: 4, items: RGBCommand.basicControls),
                               Section(itemsPerRow: 4, items: RGBCommand.basicColors)]
    let device: IRDeviceType = .rgb
}

class RGBWWRemoteControl: IRRemoteControl {
    
    let sections: [Section] = [Section(itemsPerRow: 4, items: RGBCommand.effects),
                               Section(itemsPerRow: 4, items: RGBCommand.rgbwwColors),
                               Section(itemsPerRow: 4, items: RGBCommand.wwControls),
                               Section(itemsPerRow: 4, items: RGBCommand.basicControls),
                               Section(itemsPerRow: 2, items: [RGBCommand.white, RGBCommand.candle])]
    let device: IRDeviceType = .rgbww
}


class SoundbarRemoteControl: IRRemoteControl {
    
    let sections: [Section] = [Section(itemsPerRow: 2, items: SoundbarCommand.powerGroup),
                               Section(itemsPerRow: 2, items: SoundbarCommand.mainGroup)]
    
    let device: IRDeviceType = .soundbar
}


class ProjectorRemoteControl: IRRemoteControl {
    
    let sections: [Section] = [Section(itemsPerRow: 2, items: ProjectorCommand.powerGroup),
                               Section(itemsPerRow: 2, items: ProjectorCommand.mainGroup)]
    
    let device: IRDeviceType = .projector
}

class HDMISwitchRemoteControl: IRRemoteControl {
    
    let sections: [Section] = [Section(itemsPerRow: 1, items: HDMISwitchCommand.powerGroup),
                               Section(itemsPerRow: 3, items: HDMISwitchCommand.mainGroup)]
    
    let device: IRDeviceType = .hdmiSwitch
}














