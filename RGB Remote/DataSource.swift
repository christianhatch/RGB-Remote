//
//  DataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation


enum SectionType {
    case BasicControls
    case BasicColors
    case Effects
    case SpecialControls
    case SpecialColors
}

struct Section {
    var type: SectionType
    var items: [Command]
}



protocol DataSource {
    var sections: [Section] { get }
}

extension DataSource {
    
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








//MARK: - RGBWW

class RGBWWDataSource: DataSource {
    
    let sections: [Section] = [Section(type: .Effects, items: Command.effects),
                               Section(type: .SpecialColors, items: Command.rgbwwColors),
                               Section(type: .SpecialControls, items: Command.wwControls),
                               Section(type: .BasicControls, items: Command.basicControls),
                               Section(type: .BasicColors, items: Command.basicColors)]
}


//MARK: - RGB 

class RGBDataSource: DataSource {
    
    let sections: [Section] = [Section(type: .Effects, items: Command.effects),
                               Section(type: .SpecialColors, items: Command.rgbColors),
                               Section(type: .SpecialControls, items: Command.rgbControls),
                               Section(type: .BasicControls, items: Command.basicControls),
                               Section(type: .BasicColors, items: Command.basicColors)]
}




















