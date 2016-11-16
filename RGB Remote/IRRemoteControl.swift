//
//  IRRemoteControl.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/15/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

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
    
    let sections: [Section] = []
    
    let device: IRDeviceType = .soundbar
}


class ProjectorRemoteControl: IRRemoteControl {
    
    let sections: [Section] = []
    
    let device: IRDeviceType = .projector
}

class HDMISwitchRemoteControl: IRRemoteControl {
    
    let sections: [Section] = []
    
    let device: IRDeviceType = .soundbar
}
