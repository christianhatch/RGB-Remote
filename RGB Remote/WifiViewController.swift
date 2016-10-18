//
//  WifiViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/14/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

class WifiViewController: UIViewController {
    
    fileprivate var isOn = true
    
    @IBAction func redButtonTapped(_ sender: AnyObject) {
        let command: Command = isOn ? .off : .on
        WifiController.sharedController.sendCommand(command: command)
        isOn = !isOn
    }
}



//MARK: - UIKit 

extension WifiViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.Color.darkGray.color()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
