//
//  WindowController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import Cocoa
import OBMenuBarWindow

class WindowController: NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        guard let window = window as? MainWindow else { return }
        window.menuBarIcon = NSImage(named: "MenuBarIcon")
        window.hasMenuBarIcon = true
        window.isDetachable = false
        window.attachedToMenuBar = true
        window.titleBarHeight = 0
        window.title = ""
    }
}

class MainWindow: OBMenuBarWindow {}
