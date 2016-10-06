//
//  ButtonGridViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

class ButtonGridViewController: UIViewController {
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView! {
        didSet {
            collectionView.backgroundColor = view.backgroundColor
        }
    }
    @IBOutlet fileprivate weak var collectionViewHeight: NSLayoutConstraint!
    
    internal var dataSource: iOSCollectionViewDataSource!
    
//    init(dataSource: iOSCollectionViewDataSource) {
//        self.dataSource = dataSource
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
}


//MARK: - UIKit

extension ButtonGridViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        dataSource.register(collectionView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}









class RGBButtonGridViewController: ButtonGridViewController {
    
    override var dataSource: iOSCollectionViewDataSource! {
        set {}
        get { return iOSCollectionViewDataSource(dataSource: RGBDataSource()) }
    }
}


class RGBWWButtonGridViewController: ButtonGridViewController {
    
    override var dataSource: iOSCollectionViewDataSource! {
        set {}
        get { return iOSCollectionViewDataSource(dataSource: RGBWWDataSource()) }
    }
}











