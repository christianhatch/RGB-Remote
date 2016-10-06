//
//  Logger.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/23/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation



enum LoggerNotification: String {
    case NewMessage
}

class Logger: NSObject {
    
    static let sharedLogger = Logger()
    
    var messages: [String] = []
    
    func printMessage(_ message: String) {
        print(message)
        Logger.sharedLogger.messages.append(message)
        NotificationCenter.default.post(name: Notification.Name(rawValue: LoggerNotification.NewMessage.rawValue), object: nil)
    }
    
}






