//
//  ButtonCollectionViewItem.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa

class ButtonCollectionViewItem: NSCollectionViewItem {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
    }
    
}
