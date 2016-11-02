//
//  ButtonGridViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

//class ButtonGridViewController: UIViewController {
//    
//    internal let dataSource: iOSCollectionViewDataSource
//    internal let collectionView: UICollectionView
//
//    
//    init(dataSource: iOSCollectionViewDataSource) {
//        self.dataSource = dataSource
//        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        self.dataSource = RGBDataSource(remoteControl: RGBWWRemoteControl())
//        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        super.init(coder: aDecoder)
//    }
//}
//
//
////MARK: - UIKit
//
//extension ButtonGridViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        func setupView() {            
//            collectionView.dataSource = dataSource
//            collectionView.delegate = dataSource
//            dataSource.register(collectionView: collectionView)
//            
//            view.addSubview(collectionView)
//            collectionView.snp.makeConstraints { (make) in
//                make.leading.equalToSuperview()
//                make.trailing.equalToSuperview()
//                make.top.greaterThanOrEqualTo(topLayoutGuide.snp.bottom)
//                make.bottom.equalTo(bottomLayoutGuide.snp.top)
//                make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
//            }
//            collectionView.reloadData()
//        }
//        
//        setupView()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        view.setNeedsUpdateConstraints()
//        
//        collectionView.scrollToItem(at: dataSource.lastIndexPath(), at: .bottom, animated: false)
//    }
//    
//    override func updateViewConstraints() {
//        collectionView.snp.updateConstraints { (make) in
//            make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
//        }
//        super.updateViewConstraints()
//    }
//    
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//}
























