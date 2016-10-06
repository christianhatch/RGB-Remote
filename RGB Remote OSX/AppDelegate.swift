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
    
    fileprivate let dataSource = OSXDataSource()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        window.menuBarIcon = NSImage(named: "MenuBarIcon")
        window.highlightedMenuBarIcon = NSImage(named: "MenuBarIcon_highlighted")
        window.hasMenuBarIcon = true
        window.isDetachable = false
        window.attachedToMenuBar = true
        window.titleBarHeight = 0
        
//        window.collectionView.dataSource = dataSource
//        window.collectionView.delegate = dataSource
//        dataSource.register(window.collectionView)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}












