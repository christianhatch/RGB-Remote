//
//  APIManager.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import Alamofire


class APIManager {
    
    private class func baseEndpoint() -> String {
        return "http://lights.local:3000"
    }

    class func startSendingCommand(command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)
        print(logMessage)
        
        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_start")
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
                print(response)
            })
    }
    
    class func stopSendingCommand(command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)
        print(logMessage)

        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_stop")
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
                print(response)
            })
    }
    
    class func sendCommand(command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)
        print(logMessage)

        switch command {
        default:
            Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())")
                .responseString(completionHandler: { (response) in
                    Logger.sharedLogger.printMessage(response.description)
                    print(response)
                })
            break
        }

    }
    
//    private class func sendMacro(macro: String) {
//        print(#function, macro)
//
//        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/macros/\(macro)")
//            .responseJSON { (response) -> Void in
//                print(response)
//        }
//    }
    
}






