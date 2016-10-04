//
//  FirstViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit


class ButtonGridViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let dataSource = iOSDataSource()
}

//MARK: - UIKit

extension ButtonGridViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = view.backgroundColor

        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.register(collectionView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize().height
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}














