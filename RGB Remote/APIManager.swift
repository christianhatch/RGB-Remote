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
    
    fileprivate static func baseEndpoint() -> String {
        return "http://10.0.0.51:3000"
    }

    
    static func startSending(command: CommandConvertible, forRemote: IRDeviceType) {
        let logMessage = "\(#function) \(forRemote.apiName())/\(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)
        
        sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/\(forRemote.rawValue)/\(command.apiKey())/send_start", method: .post)
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
            })
    }
    
    static func stopSending(command: CommandConvertible, forRemote: IRDeviceType) {
        let logMessage = "\(#function) \(forRemote.apiName())/\(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)

        sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/\(forRemote.rawValue)/\(command.apiKey())/send_stop", method: .post)
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
            })
    }
    
    static func send(command: CommandConvertible, forRemote: IRDeviceType) {
        let logMessage = "\(#function) \(forRemote.apiName())/\(command.apiKey())"
        Logger.sharedLogger.printMessage(logMessage)

        sharedManager.manager.request("\(APIManager.baseEndpoint())/remotes/\(forRemote.rawValue)/\(command.apiKey())", method: .post)
            .responseString(completionHandler: { (response) in
                Logger.sharedLogger.printMessage(response.description)
            })
    }
    
    static func sendMacro(macro: String) {
        let logMessage = "\(#function) \(macro)"
        Logger.sharedLogger.printMessage(logMessage)

        Alamofire.request("\(APIManager.baseEndpoint())/macros/\(macro)", method: .post)
            .responseJSON { (response) -> Void in
                Logger.sharedLogger.printMessage(response.description)
        }
    }
    
}












