//
//  RGBWWDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/24/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


class iOSDataSource: NSObject {
    private let dataSource = RGBWWDataSource()
}

//MARK: - Custom Methods

extension iOSDataSource {
    
    func register(collectionView: UICollectionView) {
        collectionView.registerNib(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
    }
    
    
    func buttonTouchDown(sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTouchDown(command)
    }
    
    func buttonTouchUp(sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTouchUp(command)
    }
    
    func buttonTapped(sender: AnyObject) {
        guard let command = Command(rawValue: sender.tag) else { return }
        dataSource.buttonTapped(command)
    }
    
}


//MARK: - UICollectionView DataSource

extension iOSDataSource: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell
        let command = dataSource.sections[indexPath.section].items[indexPath.item]
        
        cell.button.setTitle(command.humanReadableDescription(), forState: .Normal)
        cell.button.tag = command.rawValue
        cell.button.setTitleColor(command.color(), forState: .Normal)
        
        switch command {
        case .BrightnessUp, .BrightnessDown, .WhiteUp, .WhiteDown:
            cell.button.addTarget(self, action: #selector(iOSDataSource.buttonTouchDown(_:)), forControlEvents: .TouchDown)
            cell.button.addTarget(self, action: #selector(iOSDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpOutside)
            cell.button.addTarget(self, action: #selector(iOSDataSource.buttonTouchUp(_:)), forControlEvents: .TouchUpInside)
        default:
            cell.button.addTarget(self, action: #selector(iOSDataSource.buttonTapped(_:)), forControlEvents: .TouchUpInside)
            break
        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].items.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return dataSource.sections.count
    }
    
}



//MARK: - UICollectionView Delegate

extension iOSDataSource: UICollectionViewDelegateFlowLayout {
    
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
        
        let command = dataSource.sections[indexPath.section].items[indexPath.item]
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


//MARK: - Cell Class

class ButtonCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .Center
    }
}










import ChameleonFramework

//MARK: - Color Model

extension Command {
    
    func color() -> UIColor {
        
        switch self {
        case .Red:
            return UIColor.flatRedColor()
        case .Green:
            return UIColor.flatGreenColor()
        case .Blue:
            return UIColor.flatBlueColor()
        case .White:
            return UIColor.flatWhiteColor().darkenByPercentage(0.1)
            
        case .WhiteOn, .WhiteOff:
            return UIColor.flatYellowColor()
            
        case .YellowOrange, .YellowGreen, .GreenYellow:
            return UIColor.flatOrangeColor()
            
        case .RedOrange, .Orange, .OrangeYellow, .Yellow:
            return UIColor.flatOrangeColor()
            
        case .TealBlue, .IndigoBlue:
            return UIColor.flatPowderBlueColor()
            
        case .MossGreen, .Turquoise:
            return UIColor.flatGreenColor()
            
        case .LightBlue, .LightBlueWW, .SkyBlue, .SkyBlueWW:
            return UIColor.flatBlueColor().lightenByPercentage(0.5)
            
        case .DeepPurple, .Indigo, .Violet, .Purple:
            return UIColor.flatPurpleColor().lightenByPercentage(0.3)
            
        case .UV, .IndigoWW, .VioletWW, .PurpleWW:
            return UIColor.flatPurpleColor().lightenByPercentage(0.3)
            
        case .TealWhite, .IndigoWhite, .TealWhiteWW, .IndigoWhiteWW:
            return UIColor.flatTealColor().lightenByPercentage(0.2)
            
        case .PinkWhite, .PurpleWhite, .PinkWhiteWW, .PurpleWhiteWW:
            return UIColor.flatPinkColor().lightenByPercentage(0.5)
            
        default:
            return UIColor.whiteColor()
        }
    }
    
}















