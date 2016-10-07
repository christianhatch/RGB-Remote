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
    
    fileprivate let remoteControl: RemoteControl
    
    init(remoteControl: RemoteControl) {
        self.remoteControl = remoteControl
        super.init()
    }
}


//MARK: - Custom Methods

extension MacOSDataSource {
        
    func buttonTapped(sender: AnyObject) {
        guard let item = sender as? ButtonCollectionViewItem, let tag = item.textField?.tag else { return }
        guard let command = Command(rawValue: tag) else { return }
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
        item.textField?.textColor = command.color()
        item.textField?.tag = command.rawValue
        
        item.view.layer?.backgroundColor = Style.Color.black.color().cgColor
        item.textField?.backgroundColor = Style.Color.darkGray.color()
        item.decorationView?.layer?.backgroundColor = Style.Color.darkGray.color().cgColor

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
        
        let width = collectionView.bounds.width / desiredButtonsPerRow
        let size = NSSize(width: width, height: 50)
        return size
    }
}

extension MacOSDataSource: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        guard let indexPath = indexPaths.first else { return }
        guard let item = collectionView.item(at: indexPath) as? ButtonCollectionViewItem else { return }
        buttonTapped(sender: item)
        collectionView.deselectItems(at: indexPaths)
    }
    
//    func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
//        guard let indexPath = indexPaths.first else { return }
//        guard let item = collectionView.item(at: indexPath) as? ButtonCollectionViewItem else { return }
//        buttonTapped(sender: item)
//    }
}




class ButtonCollectionViewItem: NSCollectionViewItem {
    
    @IBOutlet weak var decorationView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        decorationView.layer?.cornerRadius = 5
    }
}








//MARK: - RGBWW

class RGBWWRemoteControl: RemoteControl {
    
    let sections: [Section] = [Section(type: .basicColors, items: Command.basicColors),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .specialControls, items: Command.wwControls),
                               Section(type: .specialColors, items: Command.rgbwwColors),
                               Section(type: .effects, items: Command.effects)]
    let device: RemoteControlDevice = .rgbww
}

//MARK: - RGB

class RGBRemoteControl: RemoteControl {
    
    let sections: [Section] = [Section(type: .basicColors, items: Command.basicColors),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .specialControls, items: Command.rgbControls),
                               Section(type: .specialColors, items: Command.rgbColors),
                               Section(type: .effects, items: Command.effects)]
    let device: RemoteControlDevice = .rgb
}












