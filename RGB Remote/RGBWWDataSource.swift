//
//  DataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

//MARK: - DataSource

class RGBWWDataSource: NSObject {
    
    //the sections of the collection view
    enum SectionType {
        case BasicControls
        case BasicColors
        case WWControls
        case RGBWWColors
    }
    
    struct Section {
        var type: SectionType
        var items: [Command]
    }
    
    var sections: [Section] = [Section(type: .RGBWWColors, items: Command.rgbwwColors),
                                       Section(type: .WWControls, items: Command.wwControls),
                                       Section(type: .BasicControls, items: Command.basicControls),
                                       Section(type: .BasicColors, items: Command.basicColors)]
    
}

//MARK: - IBActions

extension RGBWWDataSource {
    
    func buttonTouchDown(command: Command) {
        APIManager.startSendingCommand(command)
    }
    
    func buttonTouchUp(command: Command) {
        APIManager.stopSendingCommand(command)
    }
    
    func buttonTapped(command: Command) {
        APIManager.sendCommand(command)
    }
    
}
