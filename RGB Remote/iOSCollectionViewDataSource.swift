//
//  RGBWWDataSource.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/24/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


protocol iOSCollectionViewDataSource: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func lastIndexPath() -> IndexPath
    func register(collectionView: UICollectionView)
    init(remoteControl: RemoteControl)
    
    var remoteControl: RemoteControl { get }
}

extension iOSCollectionViewDataSource {
    func lastIndexPath() -> IndexPath {
        let section = remoteControl.sections.count-1
        let item = remoteControl.sections[section].items.count-1
        return IndexPath(item: item, section: section)
    }
}














