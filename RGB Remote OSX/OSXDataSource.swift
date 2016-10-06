//
//  OSXDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import Cocoa 

class OSXDataSource: NSObject {
    
    fileprivate var dataSource = RGBWWDataSource()
    
}

//MARK: - Custom Methods

extension OSXDataSource {
    
    func register(_ collectionView: NSCollectionView) {
        collectionView.register(NSNib(nibNamed: "ButtonCollectionViewItem", bundle: nil), forItemWithIdentifier: "ButtonCollectionViewItem")
        
        let gridLayout = NSCollectionViewGridLayout()
        gridLayout.minimumItemSize = NSSize(width: 100, height: 100)
        gridLayout.maximumItemSize = NSSize(width: 175, height: 175)
        gridLayout.minimumInteritemSpacing = 0
        gridLayout.margins = EdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.collectionViewLayout = gridLayout
    }
    
    
    func buttonTouchDown(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTouchDown(command)
    }
    
    func buttonTouchUp(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTouchUp(command)
    }
    
    func buttonTapped(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTapped(command)
    }
    
}


extension OSXDataSource: NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return dataSource.sections.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "ButtonCollectionViewItem", for: indexPath) as! ButtonCollectionViewItem
        
//        let command = dataSource.sections[indexPath.section].items[indexPath.item]
//        
//        item.button.title = command.humanReadableDescription()
//        item.button.tag = command.rawValue
////        item.button.setTitleColor(command.color(item.contentView.backgroundColor), forState: .Normal)
//        
//        switch command {
//        case .BrightnessUp, .BrightnessDown, .WhiteUp, .WhiteDown:
////            item.button.addTarget(self, action: #selector(OSXDataSource.buttonTouchDown(_:)), forControlEvents: .TouchDown)
////            item.button.addTarget(self, action: #selector(OSXDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpOutside)
////            item.button.addTarget(self, action: #selector(OSXDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpInside)
//            break
//            
//        default:
//            item.button.target = self
//            item.button.action = #selector(OSXDataSource.buttonTapped(_:))
////            item.button.addTarget(self, action: #selector(OSXDataSource.buttonTapped(_:)), forControlEvents: .TouchUpInside)
//            break
//        }
        return item
    }
}

extension OSXDataSource: NSCollectionViewDelegate {
    
}


class ButtonCollectionViewItem: NSCollectionViewItem {
    
    
    @IBOutlet weak var button: NSButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
























