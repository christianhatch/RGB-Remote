//
//  SecondViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import ChameleonFramework

class SecondViewController: UIViewController {
    private let actions = Command.rgbww
}

extension SecondViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}



//MARK: - TableView Delegate

extension SecondViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActionCell", forIndexPath: indexPath)
        
        let action = actions[indexPath.row]
        cell.textLabel?.text = action.humanReadableDescription()
        cell.textLabel?.textColor = action.color()

        return cell
    }
}


//MARK: - TableView DataSource 

extension SecondViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        APIManager.sendCommand(actions[indexPath.row])
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}







