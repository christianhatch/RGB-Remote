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
    
    static let sharedManager = APIManager()
    
    fileprivate lazy var manager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 2
        
        let man = SessionManager(configuration: config)
        return man
    }()
    
    fileprivate class func baseEndpoint() -> String {
        return "http://10.0.0.51:3000"
    }

    class func startSendingCommand(_ command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)
        
        sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_start", method: .post)
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
            })
    }
    
    class func stopSendingCommand(_ command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)

        sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_stop", method: .post)
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
            })
    }
    
    class func sendCommand(_ command: Command) {
        let logMessage = "\(#function) \(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)

        switch command {
        default:
            sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())", method: .post)
                .responseString(completionHandler: { (response) in
                    Logger.sharedLogger.printMessage(response.description)
                })
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






