//
//  SecondViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit
import ChameleonFramework

class ButtonListViewController: UIViewController {
    private let actions = Command.rgbww
}

extension ButtonListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}



//MARK: - TableView Delegate

extension ButtonListViewController: UITableViewDataSource {
    
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

extension ButtonListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        APIManager.sendCommand(actions[indexPath.row])
    }
}







