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
    
    func printMessage(message: String) {
        Logger.sharedLogger.messages.append(message)
        
        NSNotificationCenter.defaultCenter().postNotificationName(LoggerNotification.NewMessage.rawValue, object: nil)
    }
    
}






