//
//  MainWindow.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/9/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa
import OBMenuBarWindow

class MainWindow: OBMenuBarWindow {
    
    
    @IBAction func buttonClicked(sender: NSButton) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.sendCommand(tag)
    }
    
    @IBAction func powerButtonClicked(sender: AnyObject) {
        NSApp.terminate(self)
    }
    
}
