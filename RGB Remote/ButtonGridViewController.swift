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

class ButtonGridViewController: UIViewController {
    
    fileprivate let dataSource: iOSCollectionViewDataSource
    fileprivate let collectionView: UICollectionView

    
    init(dataSource: iOSCollectionViewDataSource) {
        self.dataSource = dataSource
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = iOSCollectionViewDataSource(remoteControl: RGBWWRemoteControl())
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        super.init(coder: aDecoder)
    }
}


//MARK: - UIKit

extension ButtonGridViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupView() {            
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            dataSource.register(collectionView)
            
            view.addSubview(collectionView)
            collectionView.snp.makeConstraints { (make) in
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.greaterThanOrEqualTo(topLayoutGuide.snp.bottom)
                make.bottom.equalTo(bottomLayoutGuide.snp.top)
                make.height.equalTo(collectionView.collectionViewLayout.collectionViewContentSize.height)
            }
            collectionView.reloadData()
            
            let swiper = UISwipeGestureRecognizer(target: self, action: #selector(self.showList))
            swiper.direction = [.left, .right]
            view.addGestureRecognizer(swiper)
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


extension ButtonGridViewController {
    
    func showList() {
        if case .list = dataSource.displayType {
            dataSource.displayType = .grid
        }
        else {
            dataSource.displayType = .list
        }
        view.setNeedsUpdateConstraints()
    }
    
}



//MARK: - RemoteControl

class RGBRemoteControl: RemoteControl {
    
    let sections: [Section] = [Section(type: .effects, items: Command.effects),
                               Section(type: .specialColors, items: Command.rgbColors),
                               Section(type: .specialControls, items: Command.rgbControls),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .basicColors, items: Command.basicColors)]
    let device: RemoteControlDevice = .rgb
}

class RGBWWRemoteControl: RemoteControl {
    
    let sections: [Section] = [Section(type: .effects, items: Command.effects),
                               Section(type: .specialColors, items: Command.rgbwwColors),
                               Section(type: .specialControls, items: Command.wwControls),
                               Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .basicColors, items: Command.basicColors)]
    let device: RemoteControlDevice = .rgbww
}





















