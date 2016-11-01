//
//  WifiDevice.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/19/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation


struct WifiDevice {
    let ipAddress: String
    let hardwareAddress: String
    let model: String
    
    init(discoveredString: String) {
        let parts = (discoveredString as NSString).components(separatedBy: ",")
        self.ipAddress = parts[0]
        self.hardwareAddress = parts[1]
        self.model = parts[2]
    }
    
    func asString() -> String {
        return "Wifi Device: IP = \(ipAddress)\nMAC = \(hardwareAddress)\nModel = \(model)"
    }
}
