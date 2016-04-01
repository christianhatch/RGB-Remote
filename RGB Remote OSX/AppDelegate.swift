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
    
    private let dataSource = OSXDataSource()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {

        window.menuBarIcon = NSImage(named: "MenuBarIcon")
        window.highlightedMenuBarIcon = NSImage(named: "MenuBarIcon_highlighted")
        window.hasMenuBarIcon = true
        window.isDetachable = false
        window.attachedToMenuBar = true
        
        window.collectionView.dataSource = dataSource
        window.collectionView.delegate = dataSource
        dataSource.register(window.collectionView)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}












