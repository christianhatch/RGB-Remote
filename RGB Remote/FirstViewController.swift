//
//  FirstViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import ChameleonFramework

class FirstViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var buttons: [UIButton]!
    
}

//MARK: - UIKit

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.registerNib(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
        style()
    }
    
    private func style() {
        self.setStatusBarStyle(UIStatusBarStyleContrast)
        for button in buttons {
            guard let command = Command(rawValue: button.tag) else { return }
            switch command {
            case .Red:
                button.setTitleColor(UIColor.flatRedColor(), forState: .Normal)
                break
            case .Green:
                button.setTitleColor(UIColor.flatGreenColor(), forState: .Normal)
                break
            case .Blue:
                button.setTitleColor(UIColor.flatBlueColor(), forState: .Normal)
                break
            case .White:
                button.setTitleColor(UIColor.flatWhiteColor(), forState: .Normal)
                break
            case .WhiteOn, .WhiteOff:
                button.setTitleColor(UIColor.flatYellowColor(), forState: .Normal)
                break
            default:
                button.setTitleColor(UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor, isFlat: true), forState: .Normal)
                break
            }
        }
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
        let command = Command.rgbwwColors[indexPath.item]
     
        cell.button.setTitle(command.humanReadableDescription(), forState: .Normal)
        cell.button.addTarget(self, action: #selector(FirstViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        cell.button.tag = command.rawValue
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Command.rgbwwColors.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = collectionView.bounds.width / 4
        return CGSize(width: width, height: 50)
    }
}


class ButtonCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
}














