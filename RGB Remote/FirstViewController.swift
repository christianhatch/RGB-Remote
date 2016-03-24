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
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
}

//MARK: - UIKit

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.registerNib(UINib(nibName: "ButtonCell", bundle: nil), forCellWithReuseIdentifier: "ButtonCell")
        style()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize().height
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    private func style() {
        collectionView.backgroundColor = view.backgroundColor
        
        for button in buttons {
            guard let command = Command(rawValue: button.tag) else { return }
            button.setTitleColor(command.color(view.backgroundColor), forState: .Normal)
        }
    }

}

extension Command {
    
    func color(contrasting: UIColor? = UIColor.blackColor()) -> UIColor {
        
        switch self {
        case .Red:
            return UIColor.flatRedColor()
        case .Green:
            return UIColor.flatGreenColor()
        case .Blue:
            return UIColor.flatBlueColor()
        case .White:
            return UIColor.flatWhiteColor()
        case .WhiteOn, .WhiteOff:
            return UIColor.flatYellowColor()
        case .YellowOrange, .YellowGreen, .GreenYellow:
            return UIColor.flatOrangeColor()
        case .RedOrange, .Orange, .OrangeYellow, .Yellow:
            return UIColor.flatOrangeColor()
        case .TealBlue, .IndigoBlue:
            return UIColor.flatBlueColor().colorWithAlphaComponent(0.7)
        case .MossGreen, .Turquoise:
            return UIColor.flatGreenColor()
        case .LightBlue, .LightBlueWW, .SkyBlue, .SkyBlueWW:
            return UIColor.flatBlueColor().colorWithAlphaComponent(0.7)
        case .DeepPurple, .Indigo, .Violet, .Purple:
            return UIColor.flatPurpleColor()
        case .UV, .IndigoWW, .VioletWW, .PurpleWW:
            return UIColor.flatPurpleColor()
        case .PinkWhite, .PurpleWhite, .TealWhite, .IndigoWhite:
            return UIColor.flatPinkColor().colorWithAlphaComponent(0.6)
        case .PinkWhiteWW, .PurpleWhiteWW, .TealWhiteWW, .IndigoWhiteWW:
            return UIColor.flatPinkColor().colorWithAlphaComponent(0.6)
            
        default:
            return UIColor(contrastingBlackOrWhiteColorOn: contrasting, isFlat: true)
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
        cell.button.setTitleColor(command.color(cell.contentView.backgroundColor), forState: .Normal)
        
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
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let desiredButtonsPerRow: CGFloat = 4
        let width = collectionView.bounds.width / desiredButtonsPerRow
        
        return CGSize(width: width, height: 50)
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














