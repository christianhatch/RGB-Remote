//
//  AppDelegate.swift
//  RGB Remote OSX
//
//  Created by Christian Hatch on 3/8/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: MainWindow!

    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {

        self.window.menuBarIcon = NSImage(named: "MenuBarIcon")
        self.window.highlightedMenuBarIcon = NSImage(named: "MenuBarIcon_highlighted")
        self.window.hasMenuBarIcon = true
        self.window.isDetachable = false
        self.window.attachedToMenuBar = true
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

