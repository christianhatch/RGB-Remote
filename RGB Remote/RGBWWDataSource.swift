//
//  RGBWWDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/24/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


//MARK: - DataSource

class RGBWWDataSource: NSObject {
    
    private enum SectionType {
        case BasicControls
        case BasicColors
        case WWControls
        case RGBWWColors
    }
    
    private struct Section {
        var type: SectionType
        var items: [Command]
    }
    
    private var sections: [Section] = [Section(type: .RGBWWColors, items: Command.rgbwwColors),
                                       Section(type: .WWControls, items: Command.wwControls),
                                       Section(type: .BasicControls, items: Command.basicControls),
                                       Section(type: .BasicColors, items: Command.basicColors)]
    
    func register(collectionView: UICollectionView) {
        collectionView.registerNib(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
    }
}

//MARK: - IBActions

extension RGBWWDataSource {
    
    func buttonTouchDown(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.startSendingCommand(tag)
    }
    
    func buttonTouchUp(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.stopSendingCommand(tag)
    }
    
    func buttonTapped(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.sendCommand(tag)
    }
    
}

//MARK: - UICollectionView DataSource

extension RGBWWDataSource: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell
        let command = sections[indexPath.section].items[indexPath.item]
        
        cell.button.setTitle(command.humanReadableDescription(), forState: .Normal)
        cell.button.tag = command.rawValue
        cell.button.setTitleColor(command.color(cell.contentView.backgroundColor), forState: .Normal)
        
        switch command {
        case .BrightnessUp, .BrightnessDown, .WhiteUp, .WhiteDown:
            cell.button.addTarget(self, action: #selector(RGBWWDataSource.buttonTouchDown(_:)), forControlEvents: .TouchDown)
            cell.button.addTarget(self, action: #selector(RGBWWDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpOutside)
            cell.button.addTarget(self, action: #selector(RGBWWDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpInside)
        default:
            cell.button.addTarget(self, action: #selector(RGBWWDataSource.buttonTapped(_:)), forControlEvents: .TouchUpInside)
            break
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
}

extension RGBWWDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var desiredButtonsPerRow: CGFloat = 4
        
        let command = sections[indexPath.section].items[indexPath.item]
        switch command {
        case .Red, .Green, .Blue:
            desiredButtonsPerRow = 3
            break
        case .White:
            desiredButtonsPerRow = 1
            break
        default:
            desiredButtonsPerRow = 4
            break
        }
        
        let size = CGSize(width: collectionView.bounds.width / desiredButtonsPerRow, height: 50)
        return size
    }
}


class ButtonCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .Center
    }
}
