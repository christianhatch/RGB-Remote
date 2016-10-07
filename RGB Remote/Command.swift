//
//  Command.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/21/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

enum Macro: String {
    case on
    case off
}

enum Command: Int {
    
    //generic
    static let basicControls: [Command] = [.on, .off, .brightnessUp, .brightnessDown]
    static let basicColors: [Command] = [.red, .blue, .green, .white, .candle]
    static let effects: [Command] = [.jump3, .jump7, .fade3, .fade7, .flash, .auto, .quick, .slow]

    
    //rgb
    static let rgbControls: [Command] = [.diy1, .diy2, .diy3, .diy4, .diy5, .diy6,
                                         .redUp, .greenUp, .blueUp, .redDown, .greenDown, .blueDown]
    static let rgbColors: [Command] = [.candle, .yellowOrange, .yellowGreen, .greenYellow,
                                       .tealBlue, .skyBlue, .indigoBlue, .lightBlue,
                                       .indigo, .violet, .purple, .deepPurple,
                                       .pinkWhite, .purpleWhite, .tealWhite, .indigoWhite]

    //rgbww
    static let wwControls: [Command] = [.whiteOn, .whiteOff, .whiteUp, .whiteDown]
    static let wwControlsFull: [Command] = wwControls + [.white100, .white75, .white50, .white25]
    static let rgbwwColors: [Command] = [.candle, .orange, .orangeYellow, .yellow,
                                         .mossGreen, .turquoise, .lightBlueWW, .skyBlueWW,
                                         .uv, .indigoWW, .violetWW, .purpleWW,
                                         .pinkWhiteWW, .purpleWhiteWW, .tealWhiteWW, .indigoWhiteWW]

    static let rgbww: [Command] = [.on, .off, .brightnessUp, .brightnessDown, .red, .blue, .green, .white,
                                   .whiteOn, .whiteOff, .whiteUp, .whiteDown, .white100, .white75, .white50, .white25,
                                   .candle, .orange, .orangeYellow, .yellow,
                                   .mossGreen, .turquoise, .lightBlueWW, .skyBlueWW,
                                   .uv, .indigoWW, .violetWW, .purpleWW,
                                   .pinkWhiteWW, .purpleWhiteWW, .tealWhiteWW, .indigoWhiteWW, .jump3, .jump7, .fade3, .fade7, .flash, .auto, .quick, .slow]

    case on = 1
    case off
    case brightnessUp
    case brightnessDown //4
    
    case red //5
    case green
    case blue
    case white //8
    
    case whiteOn
    case whiteOff //10
    case whiteUp  //11
    case whiteDown
    case white25
    case white50
    case white75
    case white100 //16
    
    case jump3 //17
    case jump7
    
    case fade3 //19
    case fade7
    
    case flash //21
    case auto
    
    case quick //23
    case slow
    
    //rgbww
    case candle //25
    case orange
    case orangeYellow
    case yellow
    
    case mossGreen
    case turquoise
    case lightBlueWW
    case skyBlueWW
    
    case uv
    case indigoWW
    case violetWW
    case purpleWW
    
    case pinkWhiteWW
    case purpleWhiteWW
    case tealWhiteWW
    case indigoWhiteWW
    
    
    //rgb
//    case RichOrange
    case yellowOrange
    case yellowGreen
    case greenYellow
    
    case tealBlue
    case skyBlue
    case indigoBlue
    case lightBlue
    
    case indigo
    case violet
    case purple
    case deepPurple
    
    case pinkWhite
    case purpleWhite
    case tealWhite
    case indigoWhite
    
    case diy1
    case diy2
    case diy3
    case diy4
    case diy5
    case diy6
    
    case redUp
    case redDown
    case greenUp
    case greenDown
    case blueUp
    case blueDown
}






//MARK: - Friendly Description

extension Command {
    
    func humanReadableDescription() -> String {
        switch self {
        case .on:
            return "On"
        case .off:
            return "Off"
        case .brightnessUp:
            return "Brighter"
        case .brightnessDown:
            return "Dimmer"
        case .red:
            return "Red"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .white:
            return "White"
            
        case .whiteOn:
            return "WW On"
        case .whiteOff:
            return "WW Off"
        case .whiteUp:
            return "WW Brighter"
        case .whiteDown:
            return "WW Dimmer"
        case .white25:
            return "WW 25%"
        case .white50:
            return "WW 50%"
        case .white75:
            return "WW 75%"
        case .white100:
            return "WW 100%"
            
        case .jump3:
            return "Jump 3"
        case .jump7:
            return "Jump 7"
            
        case .fade3:
            return "Fade 3"
        case .fade7:
            return "Fade 7"
            
        case .flash:
            return "Flash"
        case .auto:
            return "Auto"
            
        case .quick:
            return "Faster"
        case .slow:
            return "Slower"
            
            
        //rgbww
        case .candle:
            return "Candle"
        case .orange:
            return "Orange"
        case .orangeYellow:
            return "Orange Yellow"
        case .yellow:
            return "Yellow"
            
        case .mossGreen:
            return "Moss Green"
        case .turquoise:
            return "Turquoise"
            
        case .uv:
            return "UV"
            
        //rgb
//        case .RichOrange:
//            return "Rich Orange"
        case .yellowOrange:
            return "Yellow Orange"
        case .yellowGreen:
            return "Yellow Green"
        case .greenYellow:
            return "Green Yellow"
            
        case .tealBlue:
            return "Teal Blue"
        case .skyBlue, .skyBlueWW:
            return "Sky Blue"
        case .indigoBlue:
            return "Indigo Blue"
        case .lightBlue, .lightBlueWW:
            return "Light Blue"
            
        case .indigo, .indigoWW:
            return "Indigo"
        case .violet, .violetWW:
            return "Violet"
        case .purple, .purpleWW:
            return "Purple"
        case .deepPurple:
            return "Deep Purple"
            
        case .pinkWhite, .pinkWhiteWW:
            return "Pink White"
        case .purpleWhite, .purpleWhiteWW:
            return "Purple White"
        case .tealWhite, .tealWhiteWW:
            return "Teal White"
        case .indigoWhite, .indigoWhiteWW:
            return "Indigo White"
            
        case .diy1:
            return "DIY 1"
        case .diy2:
            return "DIY 2"
        case .diy3:
            return "DIY 3"
        case .diy4:
            return "DIY 4"
        case .diy5:
            return "DIY 5"
        case .diy6:
            return "DIY 6"
            
        case .redUp:
            return "Red Up"
        case .redDown:
            return "Red Down"
        case .greenUp:
            return "Green Up"
        case .greenDown:
            return "Green Down"
        case .blueUp:
            return "Blue Up"
        case .blueDown:
            return "Blue Down"
            
        }
    }
    
}


//MARK: - Color Model

extension Command {
    
    func color() -> XColor {
        
        switch self {
        case .red:
            return Style.Color.red.color()
        case .green:
            return Style.Color.green.color()
        case .blue:
            return Style.Color.blue.color()
        case .white:
            return Style.Color.white.color().darken(byPercentage: 0.1)!
            
        case .whiteOn, .whiteOff:
            return Style.Color.yellow.color()
            
        case .yellowOrange, .yellowGreen, .greenYellow:
            return Style.Color.orange.color()
            
        case .candle, .orange, .orangeYellow, .yellow:
            return Style.Color.orange.color()
            
        case .tealBlue, .indigoBlue:
            return Style.Color.powderBlue.color()
            
        case .mossGreen, .turquoise:
            return Style.Color.green.color()
            
        case .lightBlue, .lightBlueWW, .skyBlue, .skyBlueWW:
            return Style.Color.blue.color().lighten(byPercentage: 0.5)!
            
        case .deepPurple, .indigo, .violet, .purple:
            return Style.Color.purple.color().lighten(byPercentage: 0.3)!
            
        case .uv, .indigoWW, .violetWW, .purpleWW:
            return Style.Color.purple.color().lighten(byPercentage: 0.3)!
            
        case .tealWhite, .indigoWhite, .tealWhiteWW, .indigoWhiteWW:
            return Style.Color.teal.color().lighten(byPercentage: 0.2)!
            
        case .pinkWhite, .purpleWhite, .pinkWhiteWW, .purpleWhiteWW:
            return Style.Color.pink.color().lighten(byPercentage: 0.5)!
            
        case .redUp, .redDown:
            return Style.Color.red.color()
            
        case .greenUp, .greenDown:
            return Style.Color.green.color()
            
        case .blueUp, .blueDown:
            return Style.Color.blue.color()
            
        default:
            return Style.Color.white.color()
        }
    }
}



//MARK: - API 

extension Command {
    
    func apiKey() -> String {
        switch self {
        case .on:
            return "on"
        case .off:
            return "off"
        case .brightnessUp:
            return "up"
        case .brightnessDown:
            return "down"
        case .red:
            return "red"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .white:
            return "white"
            
        case .whiteOn:
            return "white_on"
        case .whiteOff:
            return "white_off"
        case .whiteUp:
            return "white_up"
        case .whiteDown:
            return "white_down"
        case .white25:
            return "white_25"
        case .white50:
            return "white_50"
        case .white75:
            return "white_75"
        case .white100:
            return "white_100"
            
        case .jump3:
            return "jump_3"
        case .jump7:
            return "jump_7"
            
        case .fade3:
            return "fade_3"
        case .fade7:
            return "fade_7"
            
        case .flash:
            return "flash"
        case .auto:
            return "auto"
            
        case .quick:
            return "quick"
        case .slow:
            return "slow"
            
            
            
        //rgbww
        case .candle:
            return "1"
        case .orange:
            return "5"
        case .orangeYellow:
            return "9"
        case .yellow:
            return "13"
            
        case .mossGreen:
            return "2"
        case .turquoise:
            return "6"
        case .lightBlueWW:
            return "10"
        case .skyBlueWW:
            return "14"
            
        case .uv:
            return "3"
        case .indigoWW:
            return "7"
        case .violetWW:
            return "11"
        case .purpleWW:
            return "15"
            
            
        //rgb
//        case .RichOrange:
//            return "1"
        case .yellowOrange:
            return "5"
        case .yellowGreen:
            return "9"
        case .greenYellow:
            return "13"
            
        case .tealBlue:
            return "2"
        case .skyBlue:
            return "6"
        case .indigoBlue:
            return "10"
        case .lightBlue:
            return "14"
            
        case .indigo:
            return "3"
        case .violet:
            return "7"
        case .purple:
            return "11"
        case .deepPurple:
            return "15"
            
        case .pinkWhite, .pinkWhiteWW:
            return "4"
        case .purpleWhite, .purpleWhiteWW:
            return "8"
        case .tealWhite, .tealWhiteWW:
            return "12"
        case .indigoWhite, .indigoWhiteWW:
            return "16"
            
        case .diy1:
            return "diy_1"
        case .diy2:
            return "diy_2"
        case .diy3:
            return "diy_3"
        case .diy4:
            return "diy_4"
        case .diy5:
            return "diy_5"
        case .diy6:
            return "diy_6"
            
        case .redUp:
            return "red_up"
        case .redDown:
            return "red_down"
        case .greenUp:
            return "green_up"
        case .greenDown:
            return "green_down"
        case .blueUp:
            return "blue_up"
        case .blueDown:
            return "blue_down"
            
        }
    }
    
}

//proposed new organization:

//enum CommandLED: Int {
//    case on = 1
//    case off
//    case brightnessUp
//    case brightnessDown //4
//    
//    case red //5
//    case green
//    case blue
//    case white //8
//    
//    case whiteOn
//    case whiteOff //10
//    case whiteUp  //11
//    case whiteDown
//    case white25
//    case white50
//    case white75
//    case white100 //16
//    
//    case jump3 //17
//    case jump7
//    
//    case fade3 //19
//    case fade7
//    
//    case flash //21
//    case auto
//    
//    case quick //23
//    case slow
//}
//
//enum CommandRGB: Int {
//    //    case RichOrange
//    case yellowOrange
//    case yellowGreen
//    case greenYellow
//    
//    case tealBlue
//    case skyBlue
//    case indigoBlue
//    case lightBlue
//    
//    case indigo
//    case violet
//    case purple
//    case deepPurple
//    
//    case pinkWhite
//    case purpleWhite
//    case tealWhite
//    case indigoWhite
//    
//    case diy1
//    case diy2
//    case diy3
//    case diy4
//    case diy5
//    case diy6
//    
//    case redUp
//    case redDown
//    case greenUp
//    case greenDown
//    case blueUp
//    case blueDown
//}
//
//enum CommandRGBWW: Int {
//    case candle //25
//    case orange
//    case orangeYellow
//    case yellow
//    
//    case mossGreen
//    case turquoise
//    case lightBlueWW
//    case skyBlueWW
//    
//    case uv
//    case indigoWW
//    case violetWW
//    case purpleWW
//    
//    case pinkWhiteWW
//    case purpleWhiteWW
//    case tealWhiteWW
//    case indigoWhiteWW
//}




