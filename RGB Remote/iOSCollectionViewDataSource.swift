//
//  RGBWWDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/24/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


class iOSCollectionViewDataSource: NSObject {
    
    fileprivate let dataSource: DataSource
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
        super.init()
    }
}


//MARK: - Custom Methods

extension iOSCollectionViewDataSource {
    
    func register(_ collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
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


//MARK: - UICollectionView DataSource

extension iOSCollectionViewDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
        let command = dataSource.sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).item]
        
        cell.button.setTitle(command.humanReadableDescription(), for: UIControlState())
        cell.button.tag = command.rawValue
        cell.button.setTitleColor(command.color(), for: UIControlState())
        
        switch command {
        case .brightnessUp, .brightnessDown, .whiteUp, .whiteDown:
            cell.button.addTarget(self, action: #selector(iOSCollectionViewDataSource.buttonTouchDown(_:)), for: .touchDown)
            cell.button.addTarget(self, action: #selector(iOSCollectionViewDataSource.buttonTouchUp(_:)), for: .touchUpOutside)
            cell.button.addTarget(self, action: #selector(iOSCollectionViewDataSource.buttonTouchUp(_:)), for: .touchUpInside)
        default:
            cell.button.addTarget(self, action: #selector(iOSCollectionViewDataSource.buttonTapped(_:)), for: .touchUpInside)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.sections.count
    }
    
}



//MARK: - UICollectionView Delegate

extension iOSCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var desiredButtonsPerRow: CGFloat = 4
        
        let command = dataSource.sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).item]
        switch command {
        case .red, .green, .blue:
            desiredButtonsPerRow = 3

        case .white:
            desiredButtonsPerRow = 1

        default:
            desiredButtonsPerRow = 4
        }
        
        let size = CGSize(width: collectionView.bounds.width / desiredButtonsPerRow, height: 50)
        return size
    }
}



//MARK: - Cell Class

class ButtonCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.titleLabel?.numberOfLines = 2
            button.titleLabel?.textAlignment = .center
        }
    }
}










import ChameleonFramework

//MARK: - Color Model

extension Command {
    
    func color() -> UIColor {
        
        switch self {
        case .red:
            return UIColor.flatRed()
        case .green:
            return UIColor.flatGreen()
        case .blue:
            return UIColor.flatBlue()
        case .white:
            return UIColor.flatWhite().darken(byPercentage: 0.1)
            
        case .whiteOn, .whiteOff:
            return UIColor.flatYellow()
            
        case .yellowOrange, .yellowGreen, .greenYellow:
            return UIColor.flatOrange()
            
        case .candle, .orange, .orangeYellow, .yellow:
            return UIColor.flatOrange()
            
        case .tealBlue, .indigoBlue:
            return UIColor.flatPowderBlue()
            
        case .mossGreen, .turquoise:
            return UIColor.flatGreen()
            
        case .lightBlue, .lightBlueWW, .skyBlue, .skyBlueWW:
            return UIColor.flatBlue().lighten(byPercentage: 0.5)
            
        case .deepPurple, .indigo, .violet, .purple:
            return UIColor.flatPurple().lighten(byPercentage: 0.3)
            
        case .uv, .indigoWW, .violetWW, .purpleWW:
            return UIColor.flatPurple().lighten(byPercentage: 0.3)
            
        case .tealWhite, .indigoWhite, .tealWhiteWW, .indigoWhiteWW:
            return UIColor.flatTeal().lighten(byPercentage: 0.2)
            
        case .pinkWhite, .purpleWhite, .pinkWhiteWW, .purpleWhiteWW:
            return UIColor.flatPink().lighten(byPercentage: 0.5)
            
        default:
            return UIColor.white
        }
    }
    
}















