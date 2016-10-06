//
//  ViewController.swift
//  RGB Remote macOS
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa

class ButtonGridViewController: NSViewController {

    @IBOutlet weak var collectionView: NSCollectionView!

    private let dataSource = MacOSDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        func setupView() {
//            let flowLayout = NSCollectionViewFlowLayout()
//            flowLayout.itemSize = NSSize(width: 50, height: 50)
//            flowLayout.sectionInset = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            flowLayout.minimumInteritemSpacing = 0
//            flowLayout.minimumLineSpacing = 0
            collectionView.collectionViewLayout = NSCollectionViewFlowLayout()
            
            
            view.wantsLayer = true
            collectionView.layer?.backgroundColor = NSColor.gray.cgColor
            
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
        }
        
        setupView()
    }

    
}

