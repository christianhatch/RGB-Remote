//
//  FirstViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
}

//MARK: - UIKit

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


//MARK: - IBActions

extension FirstViewController {
    
    @IBAction func buttonTapped(sender: AnyObject) {
        guard let tag = Command(rawValue: sender.tag) else { return }
        
        APIManager.sendCommand(tag)
    }
    
}











