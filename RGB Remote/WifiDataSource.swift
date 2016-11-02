//
//  WifiDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/2/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


class WifiDataSource: NSObject, iOSCollectionViewDataSource {
    internal let remoteControl: RemoteControl
    fileprivate var collectionViewRef: UICollectionView?
    
    
    required init(remoteControl: RemoteControl) {
        self.remoteControl = remoteControl
    }
}


//MARK: - Custom Methods

extension WifiDataSource {
    
    func register(collectionView: UICollectionView) {
        self.collectionViewRef = collectionView
        collectionView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
    }
    
}


//MARK: - UICollectionView DataSource

extension WifiDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
//        let command = remoteControl.sections[indexPath.section].items[indexPath.item]
        
//        cell.button.setTitle(command.humanReadableDescription(), for: UIControlState())
//        cell.button.setTitleColor(command.color(), for: UIControlState())
//        cell.button.backgroundColor = Style.Color.darkGray.color()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return remoteControl.sections[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return remoteControl.sections.count
    }
    
}



//MARK: - UICollectionView Delegate

extension WifiDataSource: UICollectionViewDelegateFlowLayout {
    
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
        
        
        let size = CGSize(width: collectionView.bounds.width / desiredButtonsPerRow, height: 50)
        return size
    }
}




