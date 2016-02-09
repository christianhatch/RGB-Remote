//
//  FirstViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import ChameleonFramework

class FirstViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
}

//MARK: - UIKit

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
    }
    
    private func style() {
        for button in buttons {
            guard let command = Command(rawValue: button.tag) else { return }
            switch command {
            case .Red:
                button.setTitleColor(UIColor.flatRedColor(), forState: .Normal)
                break
            case .Green:
                button.setTitleColor(UIColor.flatGreenColor(), forState: .Normal)
                break
            case .Blue:
                button.setTitleColor(UIColor.flatBlueColor(), forState: .Normal)
                break
            case .White:
                button.setTitleColor(UIColor.flatWhiteColor(), forState: .Normal)
                break
            case .WhiteOn, .WhiteOff:
                button.setTitleColor(UIColor.flatYellowColor(), forState: .Normal)
                break
            default:
                break
            }
        }
    }
}


//MARK: - IBActions

extension FirstViewController {
    
    @IBAction func brightnessUpTouchDown(sender: AnyObject) {
        APIManager.startSendingCommand(.BrightnessUp)
    }
    
    @IBAction func brightnessUpTouchUp(sender: AnyObject) {
        APIManager.stopSendingCommand(.BrightnessUp)
    }
    
    @IBAction func brightnessDownTouchDown(sender: AnyObject) {
        APIManager.startSendingCommand(.BrightnessDown)
    }
    
    @IBAction func brightnessDownTouchUp(sender: AnyObject) {
        APIManager.stopSendingCommand(.BrightnessDown)
    }
    
    
    @IBAction func buttonTapped(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        
        APIManager.sendCommand(tag)
    }
    
}











