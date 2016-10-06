//
//  DataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation


enum SectionType {
    case basicControls
    case basicColors
    case effects
    case specialControls
    case specialColors
}

struct Section {
    var type: SectionType
    var items: [Command]
}



protocol DataSource {
    var sections: [Section] { get }
}

extension DataSource {
    
    func buttonTouchDown(_ command: Command) {
        APIManager.startSendingCommand(command)
    }
    
    func buttonTouchUp(_ command: Command) {
        APIManager.stopSendingCommand(command)
    }
    
    func buttonTapped(_ command: Command) {
        APIManager.sendCommand(command)
    }
    
}








//MARK: - RGBWW

class RGBWWDataSource: DataSource {
    
    let sections: [Section] = [Section(type: .effects, items: Command.effects),
                               Section(type: .specialColors, items: Command.rgbwwColors),
                               Section(type: .specialControls, items: Command.wwControls),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .basicColors, items: Command.basicColors)]
}


//MARK: - RGB 

class RGBDataSource: DataSource {
    
    let sections: [Section] = [Section(type: .effects, items: Command.effects),
                               Section(type: .specialColors, items: Command.rgbColors),
                               Section(type: .specialControls, items: Command.rgbControls),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .basicColors, items: Command.basicColors)]
}




















