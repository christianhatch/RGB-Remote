//
//  TodayViewController.swift
//  RGB Remote Widget macOS
//
//  Created by Christian Hatch on 10/6/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Cocoa
import NotificationCenter

class TodayViewController: NSViewController {
    override var nibName: String? { return "TodayViewController" }

    
    @IBOutlet weak var collectionView: NSCollectionView!
    fileprivate var dataSource: MacOSDataSource {
        didSet {
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
    }
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        dataSource = CoreCollectionViewDataSource()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        dataSource = CoreCollectionViewDataSource()
        super.init(coder: coder)
    }
}

//MARK: - Lifecycle 

extension TodayViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupView() {
            collectionView.register(NSNib(nibNamed: "ButtonCollectionViewItem", bundle: nil), forItemWithIdentifier: "ButtonCollectionViewItem")
            collectionView.collectionViewLayout = NSCollectionViewFlowLayout()
            collectionView.backgroundColors = [Style.Color.clear.color()]
            collectionView.enclosingScrollView?.borderType = .noBorder
            
            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
        
        setupView()
    }
    
    override func viewWillLayout() {
        preferredContentSize = collectionView.collectionViewLayout?.collectionViewContentSize ?? NSSize(width: 320, height: 300)
        super.viewWillLayout()
    }
}


extension TodayViewController: NCWidgetProviding {
    var widgetAllowsEditing: Bool { return false }
    
    func widgetPerformUpdate(completionHandler: @escaping (NCUpdateResult) -> Void) {
        collectionView.reloadData()
        completionHandler(.newData)
    }
    
    func widgetMarginInsets(forProposedMarginInsets defaultMarginInset: EdgeInsets) -> EdgeInsets {
        return EdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}









//MARK: - Remote Control

class CoreRemoteControl: RemoteControl {
    
    let sections: [Section] = [Section(type: .basicControls, items: Command.basicControls),
                               Section(type: .basicColors, items: [.white, .candle])]
    let device: RemoteControlDevice = .rgbww
}



//MARK: - DataSource

class CoreCollectionViewDataSource: TodayWidgetCollectionViewDataSource {
    init() {
        super.init(remoteControl: CoreRemoteControl())
    }
    //we dont want any spacing, because the today widget has a fixed small size
    override func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
        return .zero
    }
}


class TodayWidgetCollectionViewDataSource: MacOSDataSource {
    //make the cells a bit lighter color to match the today widget color scheme
    override func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = super.collectionView(collectionView, itemForRepresentedObjectAt: indexPath) as! ButtonCollectionViewItem
        item.view.layer?.backgroundColor = Style.Color.clear.color().cgColor
        item.textField?.backgroundColor = Style.Color.lightGray.color()
        item.decorationView?.layer?.backgroundColor = Style.Color.lightGray.color().cgColor
        return item
    }
}






















