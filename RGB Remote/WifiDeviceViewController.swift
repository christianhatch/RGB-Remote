//
//  WifiDeviceViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 11/2/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit


class WifiDeviceViewController: UIViewController {
    fileprivate let devices: [WifiDevice]
    fileprivate var controllers: [WifiController] {
        return devices.map{ WifiController(ipAddress: $0.ipAddress) }
    }
    
    fileprivate let dataSource: WifiDataSource = WifiDataSource()
    fileprivate let collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }()
    
    init(devices: [WifiDevice]) {
        self.devices = devices
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.devices = []
        super.init(coder: aDecoder)
    }
}


//MARK: - UIKit

extension WifiDeviceViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupView() {
            dataSource.delegate = self
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            dataSource.register(collectionView: collectionView)
            
            view.addSubview(collectionView)
            collectionView.snp.makeConstraints { (make) in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.greaterThanOrEqualTo(topLayoutGuide.snp.bottom)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
                make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
            }
            collectionView.reloadData()
        }
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.setNeedsUpdateConstraints()
        collectionView.scrollToItem(at: dataSource.lastIndexPath(), at: .bottom, animated: false)
    }
    
    override func updateViewConstraints() {
        collectionView.snp.updateConstraints { (make) in
            make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
        }
        super.updateViewConstraints()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}




extension WifiDeviceViewController: WifiDataSourceDelegate {
    
    func commandTapped(command: WifiCommand) {
        sendCommand(command: command)
    }
    
    fileprivate func sendCommand(command: WifiCommand) {
        controllers.forEach{$0.send(command: command)}
    }
    
}
















