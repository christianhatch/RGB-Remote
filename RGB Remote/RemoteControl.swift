//
//  DataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation


//A SectionType is a generic way to organize groups of Commands, based on what those Commands are controlling.
enum SectionType {
    case basicControls
    case basicColors
    case effects
    
    case specialControls
    case specialColors
    
    
    func numberOfRows() -> Float {
        switch self {
        case .basicControls:
            return 4
        case .basicColors:
            return 3
        case .effects:
            return 4
        case .specialControls:
            return 4
        case .specialColors:
            return 4
        }
    }
}


//A Section is a collection of Commands organized by a particular type.
struct Section {
    var type: SectionType
    var items: [Command]
}

//A RemoteControlDevice is the device to which the Commands of that RemoteControl will be directed.
enum RGBRemoteControlDevice: String {
    case rgb
    case rgbww
}

//A Remote Control is a collection of sections of Commands, and a device type. Think of it as the physical remote control that you would hold in your hand.
protocol RemoteControl {
    var sections: [Section] { get }
    var device: RGBRemoteControlDevice { get }
    
    func buttonTouchDown(_ command: Command)
    func buttonTouchUp(_ command: Command)
    func buttonTapped(_ command: Command)
}

extension RemoteControl {
    
    func buttonTouchDown(_ command: Command) {
        APIManager.startSending(command: command, forRemote: device)
    }
    
    func buttonTouchUp(_ command: Command) {
        APIManager.stopSending(command: command, forRemote: device)
    }
    
    func buttonTapped(_ command: Command) {
        APIManager.send(command: command, forRemote: device)
    }
    
}
























