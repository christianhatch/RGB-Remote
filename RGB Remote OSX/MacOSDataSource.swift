//
//  MacOSDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 4/1/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import Cocoa 

class MacOSDataSource: NSObject {
    
    fileprivate let remoteControl = RGBWWRemoteControl()
    
}

//MARK: - Custom Methods

extension MacOSDataSource {
        
    func buttonTouchDown(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        remoteControl.buttonTouchDown(command)
    }
    
    func buttonTouchUp(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        remoteControl.buttonTouchUp(command)
    }
    
    func buttonTapped(_ sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        remoteControl.buttonTapped(command)
    }
    
}


extension MacOSDataSource: NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return remoteControl.sections.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return remoteControl.sections[section].items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "ButtonCollectionViewItem", for: indexPath) as! ButtonCollectionViewItem
        let command = remoteControl.sections[indexPath.section].items[indexPath.item]

        item.textField?.stringValue = command.humanReadableDescription()
        item.textField?.tag = command.rawValue
        item.textField?.textColor = command.color()

        return item
    }
}

extension MacOSDataSource: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return NSSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        var desiredButtonsPerRow: CGFloat = 4
        
        let section = remoteControl.sections[indexPath.section]
        let command = section.items[indexPath.item]
        
        
        switch command {
        case .red, .green, .blue:
            desiredButtonsPerRow = 3
            
        case .white:
            desiredButtonsPerRow = 2
            
        case .candle:
            if section.type == .basicColors {
                desiredButtonsPerRow = 2
            }
            
        case .diy1, .diy2, .diy3, .diy4, .diy5, .diy6, .redUp, .redDown, .greenUp, .greenDown, .blueUp, .blueDown:
            desiredButtonsPerRow = 3
            
        default:
            desiredButtonsPerRow = 4
        }
        
        let size = NSSize(width: collectionView.bounds.width / desiredButtonsPerRow, height: 50)
        return size
    }
}

extension MacOSDataSource: NSCollectionViewDelegate {
    
//    func collectionView(collectionView: NSCollectionView, didSelectItemsAtIndexPaths indexPaths: Set<NSIndexPath>) {
//        guard let indexPath = indexPaths.first else {return}
//        guard let item = collectionView.itemAtIndexPath(indexPath) else {return}
//        (item as! CollectionViewItem).setHighlight(true)
//    }
//    
//    func collectionView(collectionView: NSCollectionView, didDeselectItemsAtIndexPaths indexPaths: Set<NSIndexPath>) {
//        guard let indexPath = indexPaths.first else {return}
//        guard let item = collectionView.itemAtIndexPath(indexPath) else {return}
//        (item as! CollectionViewItem).setHighlight(false)
//    }
    
}

















