//
//  TodayViewController.swift
//  RGB Remote Widget iOS
//
//  Created by Christian Hatch on 10/5/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController {
    
    fileprivate var dataSource: iOSCollectionViewDataSource = {
        return iOSCollectionViewDataSource(dataSource: CoreDataSource())
    }
    @IBOutlet fileprivate weak var collectionView: UICollectionView!

}

//MARK: - UIKit 

extension TodayViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func setupView() {
            collectionView.backgroundColor = view.backgroundColor
            
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            dataSource.register(collectionView)
            collectionView.reloadData()
        }
        
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdate(_ completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
