//
//  DataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


struct Section {
    let itemsPerRow: CGFloat
    let items: [CommandConvertible]
}


enum IRDeviceType: String {
    case rgb
    case rgbww
    case projector
    case hdmiSwitch
    case soundbar
    
    func apiName() -> String {
        return rawValue
    }
}


protocol IRRemoteControl {
    var sections: [Section] { get }
    var device: IRDeviceType { get }
}























