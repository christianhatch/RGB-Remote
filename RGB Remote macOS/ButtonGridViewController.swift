//
//  ViewController.swift
//  RGB Remote macOS
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa

class ButtonGridViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView! {
        didSet {
            collectionView.collectionViewLayout = NSCollectionViewFlowLayout()
            collectionView.backgroundColors = [Style.Color.black.color()]

            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
        }
    }
    private let dataSource = MacOSDataSource(remoteControl: RGBWWRemoteControl())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true
    }
}
