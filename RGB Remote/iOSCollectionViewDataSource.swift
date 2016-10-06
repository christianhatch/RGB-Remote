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
    enum DisplayType {
        case grid
        case list
    }

    var displayType: DisplayType = .grid {
        didSet {
            collectionViewRef?.reloadData()
        }
    }
    let dataSource: DataSource
    fileprivate var collectionViewRef: UICollectionView?
    
    init(dataSource: DataSource) {
        self.dataSource = dataSource
        super.init()
    }
}


//MARK: - Custom Methods

extension iOSCollectionViewDataSource {
    
    func register(_ collectionView: UICollectionView) {
        self.collectionViewRef = collectionView
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
        
        let section = dataSource.sections[indexPath.section]
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

        if case .list = displayType {
            desiredButtonsPerRow = 1
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















