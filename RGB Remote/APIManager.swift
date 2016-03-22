//
//  APIManager.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
//import Alamofire


class APIManager {
    
    private class func baseEndpoint() -> String {
        return "http://lights.local:3000"
    }

    class func startSendingCommand(command: Command) {
        print(#function, command.apiKey())
        
//        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_start")
//            .responseJSON { (response) -> Void in
////                print(response)
//        }
    }
    
    class func stopSendingCommand(command: Command) {
        print(#function, command.apiKey())

//        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())/send_stop")
//            .responseJSON { (response) -> Void in
////                    print(response)
//        }
    }
    
    class func sendCommand(command: Command) {
        print(#function, command.apiKey())

        switch command {
        default:
//            Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgbww/\(command.apiKey())")
//                .responseJSON { (response) -> Void in
////                    print(response)
//            }
            break
        }

    }
    
    private class func sendMacro(macro: String) {
        print(#function, macro)

//        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/macros/\(macro)")
//            .responseJSON { (response) -> Void in
////                print(response)
//        }
    }
    
}






