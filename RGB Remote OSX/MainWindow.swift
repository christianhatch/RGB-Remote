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
        
}





//MARK: - IBAction

extension MainWindow {
    
    @IBAction func buttonClickedWithSender(_ sender: NSButton) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.send(command: tag, forRemote: .rgbww)
    }
    
    @IBAction func powerButtonClickedWithSender(_ sender: AnyObject) {
        NSApp.terminate(self)
    }
    
}
