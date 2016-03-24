//
//  FirstViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import ChameleonFramework

private enum SectionType {
    case BasicControls
    case BasicColors
    case WWControls
    case RGBWWColors
}
private struct Section {
    var type: SectionType
    var items: [Command]
}

class FirstViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    private var collectionViewSections: [Section] = [Section(type: .RGBWWColors, items: Command.rgbwwColors),
                                                     Section(type: .WWControls, items: Command.wwControls),
                                                     Section(type: .BasicControls, items: Command.basicControls),
                                                     Section(type: .BasicColors, items: Command.basicColors)]
}

//MARK: - UIKit

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.registerNib(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
        collectionView.backgroundColor = view.backgroundColor
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize().height
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

//MARK: - IBActions

extension FirstViewController {
    
    @IBAction func buttonTouchDown(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.startSendingCommand(tag)
    }
    
    @IBAction func buttonTouchUp(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.stopSendingCommand(tag)
    }
    
    
    @IBAction func buttonTapped(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        APIManager.sendCommand(tag)
    }
    
}


//MARK: - UICollectionView DataSource 

extension FirstViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell
        let command = collectionViewSections[indexPath.section].items[indexPath.item]
     
        cell.button.setTitle(command.humanReadableDescription(), forState: .Normal)
        cell.button.addTarget(self, action: #selector(FirstViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        cell.button.tag = command.rawValue
        cell.button.setTitleColor(command.color(cell.contentView.backgroundColor), forState: .Normal)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewSections[section].items.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return collectionViewSections.count
    }

}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 10)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        var desiredButtonsPerRow: CGFloat = 4
        
        let command = collectionViewSections[indexPath.section].items[indexPath.row]
        switch command {
        case .Red, .Green, .Blue:
            desiredButtonsPerRow = 3
            break
        case .White:
            desiredButtonsPerRow = 1
            break
        default:
            desiredButtonsPerRow = 4
            break
        }
        
        return CGSize(width: collectionView.bounds.width / desiredButtonsPerRow, height: 50)
    }
}


class ButtonCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .Center
    }
}














