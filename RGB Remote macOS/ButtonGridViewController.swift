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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }

    private func configureCollectionView() {

        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 50, height: 50)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        collectionView.collectionViewLayout = flowLayout

        view.wantsLayer = true

        collectionView.layer?.backgroundColor = .gray
    }


}

