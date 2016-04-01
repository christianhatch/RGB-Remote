//
//  Command.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/21/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

enum Command: Int {
    
    static let rgbww: [Command] = [.On, .Off, .BrightnessUp, .BrightnessDown, .Red, .Blue, .Green, .White, .WhiteOn, .WhiteOff, .WhiteUp, .WhiteDown, .White100, .White75, .White50, .White25,
                                    .RedOrange, .Orange, .OrangeYellow, .Yellow,
                                    .MossGreen, .Turquoise, .LightBlueWW, .SkyBlueWW,
                                    .UV, .IndigoWW, .VioletWW, .PurpleWW,
                                    .PinkWhiteWW, .PurpleWhiteWW, .TealWhiteWW, .IndigoWhiteWW, .Jump3, .Jump7, .Fade3, .Fade7, .Flash, .Auto, .Quick, .Slow]
    
//    static var rgb: [Command] = Command.basicControls + Command.basicColors + Command.rgbControls + Command.rgbColors + Command.effects

//    static let rgbww: [Command] = Command.basicControls + Command.basicColors + Command.wwControls + Command.rgbwwColors + Command.effects

    static let effects: [Command] = [.Jump3, .Jump7, .Fade3, .Fade7, .Flash, .Auto, .Quick, .Slow]
    static let basicControls: [Command] = [.On, .Off, .BrightnessUp, .BrightnessDown]
    static let basicColors: [Command] = [.Red, .Blue, .Green, .White]

    static let wwControlsFull: [Command] = [.WhiteOn, .WhiteOff, .WhiteUp, .WhiteDown, .White100, .White75, .White50, .White25]
    static let wwControls: [Command] = [.WhiteOn, .WhiteOff, .WhiteUp, .WhiteDown]
    static let rgbControls: [Command] = [.DIY1, .DIY2, .DIY3, .DIY4, .DIY5, .DIY6, .RedUp, .RedDown, .GreenUp, .GreenDown, .BlueUp, .BlueDown]

    static let rgbColors: [Command] = [.OrangeYellow, .YellowOrange, .YellowGreen, .GreenYellow,
                                       .TealBlue, .SkyBlue, .IndigoBlue, .LightBlue,
                                       .Indigo, .Violet, .Purple, .DeepPurple,
                                       .PinkWhite, .PurpleWhite, .TealWhite, .IndigoWhite]

    static let rgbwwColors: [Command] = [.RedOrange, .Orange, .OrangeYellow, .Yellow,
                                         .MossGreen, .Turquoise, .LightBlueWW, .SkyBlueWW,
                                         .UV, .IndigoWW, .VioletWW, .PurpleWW,
                                         .PinkWhiteWW, .PurpleWhiteWW, .TealWhiteWW, .IndigoWhiteWW]

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
            return "WW On"
        case .WhiteOff:
            return "WW Off"
        case .WhiteUp:
            return "WW Up"
        case .WhiteDown:
            return "WW Down"
        case .White25:
            return "WW 25%"
        case .White50:
            return "WW 50%"
        case .White75:
            return "WW 75%"
        case .White100:
            return "WW 100%"
            
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
            return "white_off"
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
            
            
            
        //rgbww
        case .RedOrange:
            return "1"
        case .Orange:
            return "5"
        case .OrangeYellow:
            return "9"
        case .Yellow:
            return "13"
            
        case .MossGreen:
            return "2"
        case .Turquoise:
            return "6"
        case .LightBlueWW:
            return "10"
        case .SkyBlueWW:
            return "14"
            
        case .UV:
            return "3"
        case .IndigoWW:
            return "7"
        case .VioletWW:
            return "11"
        case .PurpleWW:
            return "15"
            
            
        //rgb
        case .RichOrange:
            return "1"
        case .YellowOrange:
            return "5"
        case .YellowGreen:
            return "9"
        case .GreenYellow:
            return "13"
            
        case .TealBlue:
            return "2"
        case .SkyBlue:
            return "6"
        case .IndigoBlue:
            return "10"
        case .LightBlue:
            return "14"
            
        case .Indigo:
            return "3"
        case .Violet:
            return "7"
        case .Purple:
            return "11"
        case .DeepPurple:
            return "15"
            
        case .PinkWhite, .PinkWhiteWW:
            return "4"
        case .PurpleWhite, .PurpleWhiteWW:
            return "8"
        case .TealWhite, .TealWhiteWW:
            return "12"
        case .IndigoWhite, .IndigoWhiteWW:
            return "16"
            
        case .DIY1:
            return "diy_1"
        case .DIY2:
            return "diy_2"
        case .DIY3:
            return "diy_3"
        case .DIY4:
            return "diy_4"
        case .DIY5:
            return "diy_5"
        case .DIY6:
            return "diy_6"
            
        case .RedUp:
            return "red_up"
        case .RedDown:
            return "red_down"
        case .GreenUp:
            return "green_up"
        case .GreenDown:
            return "green_down"
        case .BlueUp:
            return "blue_up"
        case .BlueDown:
            return "blue_down"
            
        }
    }
    
}




