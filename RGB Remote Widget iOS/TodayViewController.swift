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
    
    fileprivate var dataSource: iOSCollectionViewDataSource {
        didSet {
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
    }
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
        dataSource = CoreCollectionViewDataSource()
        super.init(coder: aDecoder)
    }
}


//MARK: - UIKit 

extension TodayViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func setupView() {
            extensionContext?.widgetLargestAvailableDisplayMode = .expanded
            
            collectionView.backgroundColor = view.backgroundColor
            dataSource.register(collectionView)

            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        preferredContentSize = collectionView.collectionViewLayout.collectionViewContentSize
        super.viewDidLayoutSubviews()
    }
}


extension TodayViewController: NCWidgetProviding {
    
    func widgetPerformUpdate(_ completionHandler: ((NCUpdateResult) -> Void)) {
        collectionView.reloadData()
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        switch activeDisplayMode {
        case .compact:
            dataSource = CoreCollectionViewDataSource()

        case .expanded:
            dataSource = TodayWidgetCollectionViewDataSource(remoteControl: RGBWWNoEffectsRemoteControl())
        }
    }
}









class CoreCollectionViewDataSource: TodayWidgetCollectionViewDataSource {
    init() {
        super.init(remoteControl: CoreRemoteControl())
    }
    //we dont want any spacing, because the today widget has a fixed small size
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 0)
    }
}


class TodayWidgetCollectionViewDataSource: iOSCollectionViewDataSource {
    //make the cells a bit lighter color to match the today widget color scheme
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! ButtonCell
        cell.button.backgroundColor = Style.Color.darkGray.color()
        return cell
    }
}



























