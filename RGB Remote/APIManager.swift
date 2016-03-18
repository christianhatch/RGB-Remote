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
    
    static let rgbww: [Command] = [.On, .White, .Blue, .Green, .Red,
                                   .OrangeYellow, .YellowOrange, .YellowGreen, .GreenYellow,
                                   .TealBlue, .SkyBlue, .IndigoBlue, .LightBlue,
                                   .Indigo, .Violet, .Purple, .DeepPurple,
                                   .PinkWhite, .PurpleWhite, .TealWhite, .IndigoWhite,
                                   .DIY1, .DIY2, .DIY3, .DIY4, .DIY5, .DIY6,
                                   .RedUp, .RedDown, .GreenUp, .GreenDown, .BlueUp, .BlueDown]
    static let rgb: [Command] = []
    
    case On = 1
    case Off
    case BrightnessUp
    case BrightnessDown //4
    
    case Red //5
    case Green
    case Blue
    case White //8
    
    case WhiteOn 
    case WhiteOff //10
    case WhiteUp  //11
    case WhiteDown
    case White25 
    case White50 
    case White75 
    case White100 //16
    
    case Jump3 //17
    case Jump7 
    
    case Fade3 //19
    case Fade7 
    
    case Flash //21
    case Auto
    
    case Quick //23
    case Slow
    
    //rgbww
    case RedOrange
    case Orange
    case OrangeYellow
    case Yellow
    
    case MossGreen
    case Turquoise
    case LightBlueWW
    case SkyBlueWW
   
    case UV
    case IndigoWW
    case VioletWW
    case PurpleWW
    
    case PinkWhiteWW
    case PurpleWhiteWW
    case TealWhiteWW
    case IndigoWhiteWW
    
    
    //rgb
    case RichOrange
    case YellowOrange
    case YellowGreen
    case GreenYellow
    
    case TealBlue
    case SkyBlue
    case IndigoBlue
    case LightBlue

    case Indigo
    case Violet
    case Purple
    case DeepPurple
    
    case PinkWhite
    case PurpleWhite
    case TealWhite
    case IndigoWhite
    
    case DIY1
    case DIY2
    case DIY3
    case DIY4
    case DIY5
    case DIY6

    case RedUp
    case RedDown
    case GreenUp
    case GreenDown
    case BlueUp
    case BlueDown
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
            
            
        //rgbww
        case .RedOrange:
            return "Red Orange"
        case .Orange:
            return "Orange"
        case .OrangeYellow:
            return "Orange Yellow"
        case .Yellow:
            return "Yellow"
            
        case .MossGreen:
            return "Moss Green"
        case .Turquoise:
            return "Turquoise"
//        case .LightBlue:
//            return "Light Blue"
//        case .SkyBlue:
//            return "Sky Blue"
            
        case .UV:
            return "UV"
//        case .Indigo:
//            return "Indigo"
//        case .Violet:
//            return "Violet"
//        case .Purple:
//            return "Purple"
            
//        case .PinkWhite:
//            return "Pink White"
//        case .PurpleWhite:
//            return "Purple White"
//        case .TealWhite:
//            return "Teal White"
//        case .IndigoWhite:
//            return "Indigo White"

            
        //rgb
        case .RichOrange:
            return "Rich Orange"
        case .YellowOrange:
            return "Yellow Orange"
        case .YellowGreen:
            return "Yellow Green"
        case .GreenYellow:
            return "Green Yellow"
            
        case .TealBlue:
            return "Teal Blue"
        case .SkyBlue, .SkyBlueWW:
            return "Sky Blue"
        case .IndigoBlue:
            return "Indigo Blue"
        case .LightBlue, .LightBlueWW:
            return "Light Blue"
            
        case .Indigo, .IndigoWW:
            return "Indigo"
        case .Violet, .VioletWW:
            return "Violet"
        case .Purple, .PurpleWW:
            return "Purple"
        case .DeepPurple:
            return "Deep Purple"
            
        case .PinkWhite, .PinkWhiteWW:
            return "Pink White"
        case .PurpleWhite, .PurpleWhiteWW:
            return "Purple White"
        case .TealWhite, .TealWhiteWW:
            return "Teal White"
        case .IndigoWhite, .IndigoWhiteWW:
            return "Indigo White"
            
        case .DIY1:
            return "DIY 1"
        case .DIY2:
            return "DIY 2"
        case .DIY3:
            return "DIY 3"
        case .DIY4:
            return "DIY 4"
        case .DIY5:
            return "DIY 5"
        case .DIY6:
            return "DIY 6"
            
        case .RedUp:
            return "Red Up"
        case .RedDown:
            return "Red Down"
        case .GreenUp:
            return "Green Up"
        case .GreenDown:
            return "Green Down"
        case .BlueUp:
            return "Blue Up"
        case .BlueDown:
            return "Blue Down"

        }
    }

}

extension Command {
    
    func apiKey() -> String {
        switch self {
        case .On:
            return "on"
        case .Off:
            return "off"
        case .BrightnessUp:
            return "up"
        case .BrightnessDown:
            return "down"
        case .Red:
            return "red"
        case .Green:
            return "green"
        case .Blue:
            return "blue"
        case .White:
            return "white"
            
        case .WhiteOn:
            return "white_on"
        case .WhiteOff:
            return "white_on"
        case .WhiteUp:
            return "white_up"
        case .WhiteDown:
            return "white_down"
        case .White25:
            return "white_25"
        case .White50:
            return "white_50"
        case .White75:
            return "white_75"
        case .White100:
            return "white_100"
            
        case .Jump3:
            return "jump_3"
        case .Jump7:
            return "jump_7"
            
        case .Fade3:
            return "fade_3"
        case .Fade7:
            return "fade_7"
            
        case .Flash:
            return "flash"
        case .Auto:
            return "auto"
            
        case .Quick:
            return "quick"
        case .Slow:
            return "slow"
            
            
        }
    }
    
}

class APIManager {
    
    private class func baseEndpoint() -> String {
        return "http://10.0.0.17:3000"
    }

    class func startSendingCommand(command: Command) {
        print(__FUNCTION__, command.apiKey())
        
        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgb_led/\(command.apiKey())/send_start")
            .responseJSON { (response) -> Void in
//                print(response)
        }
    }
    
    class func stopSendingCommand(command: Command) {
        print(__FUNCTION__, command.apiKey())

        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgb_led/\(command.apiKey())/send_stop")
            .responseJSON { (response) -> Void in
//                    print(response)
        }
    }
    
    class func sendCommand(command: Command) {
        print(__FUNCTION__, command.apiKey())

        switch command {
        default:
            Alamofire.request(.POST, "\(APIManager.baseEndpoint())/remotes/rgb_led/\(command.apiKey())")
                .responseJSON { (response) -> Void in
//                    print(response)
            }
            break
        }

    }
    
    private class func sendMacro(macro: String) {
        print(__FUNCTION__, macro)

        Alamofire.request(.POST, "\(APIManager.baseEndpoint())/macros/\(macro)")
            .responseJSON { (response) -> Void in
//                print(response)
        }
    }
    
}






