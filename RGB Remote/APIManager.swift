//
//  APIManager.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import Alamofire

enum Command: Int {
    
    static let all: [Command] = [.On, .Off, .BrightnessUp, .BrightnessDown, .Red, .Green, .Blue, .White, .WhiteOn, .WhiteOff, .WhiteUp, .WhiteDown, .White25, .White25, .White75, .White100, .Jump3, .Jump7, .Fade3, .Fade7, .Flash, .Auto, .Quick, .Slow]
    
    case On = 1
    case Off
    case BrightnessUp
    case BrightnessDown
    case Red
    case Green
    case Blue
    case White
    
    case WhiteOn 
    case WhiteOff
    case WhiteUp 
    case WhiteDown
    case White25 
    case White50 
    case White75 
    case White100
    
    case Jump3
    case Jump7 
    
    case Fade3 
    case Fade7 
    
    case Flash 
    case Auto
    
    case Quick 
    case Slow
}

//MARK: - Friendly Description

extension Command {
    
    func humanReadableDescription() -> String {
        switch self {
        case .On:
            return "On"
        case .Off:
            return "Off"
        case .BrightnessUp:
            return "Brightness Up"
        case .BrightnessDown:
            return "Brightness Down"
        case .Red:
            return "Red"
        case .Green:
            return "Green"
        case .Blue:
            return "Blue"
        case .White:
            return "White"
            
        case .WhiteOn:
            return "Warm White On"
        case .WhiteOff:
            return "Warm White Off"
        case .WhiteUp:
            return "Warm White Brightness Up"
        case .WhiteDown:
            return "Warm White Brightness Down"
        case .White25:
            return "Warm White 25%"
        case .White50:
            return "Warm White 50%"
        case .White75:
            return "Warm White 75%"
        case .White100:
            return "Warm White 100%"
            
        case .Jump3:
            return "Jump 3"
        case .Jump7:
            return "Jump 7"
            
        case .Fade3:
            return "Fade 3"
        case .Fade7:
            return "Fade 7"
            
        case .Flash:
            return "Flash"
        case .Auto:
            return "Auto"
            
        case .Quick:
            return "Faster"
        case .Slow:
            return "Slower"
        }
    }

}

extension Command {
    
    func apiKey() -> String {
        switch self {
        case .On:
            return "KEY_ON"
        case .Off:
            return "KEY_OFF"
        case .BrightnessUp:
            return "KEY_BRIGHTNESSUP"
        case .BrightnessDown:
            return "KEY_BRIGHTNESSDOWN"
        case .Red:
            return "KEY_RED"
        case .Green:
            return "KEY_GREEN"
        case .Blue:
            return "KEY_BLUE"
        case .White:
            return "KEY_WHITE"
            
        case .WhiteOn:
            return "KEY_WHITEON"
        case .WhiteOff:
            return "KEY_WHITEOFF"
        case .WhiteUp:
            return "KEY_WHITEUP"
        case .WhiteDown:
            return "KEY_WHITEDOWN"
        case .White25:
            return "KEY_WHITE25"
        case .White50:
            return "KEY_WHITE50"
        case .White75:
            return "KEY_WHITE75"
        case .White100:
            return "KEY_WHITE100"
            
        case .Jump3:
            return "KEY_JUMP3"
        case .Jump7:
            return "KEY_JUMP7"
            
        case .Fade3:
            return "KEY_FADE3"
        case .Fade7:
            return "KEY_FADE7"
            
        case .Flash:
            return "KEY_FLASH"
        case .Auto:
            return "KEY_AUTO"
            
        case .Quick:
            return "KEY_QUICK"
        case .Slow:
            return "KEY_SLOW"
        }
    }
    
}

class APIManager {

    class func sendCommand(command: Command) {
        Alamofire.request(.POST, "http://lights.local:3000/remotes/rgb_led/\(command.apiKey())")
        .response { (request, response, data, error) -> Void in
            print("error", error)
            print("response", response)
            print("data", data)
        }
    }
    
}






