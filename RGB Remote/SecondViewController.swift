//
//  SecondViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private let actions = Command.all
}

extension SecondViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        guard let cell = tableView.dequeueReusableCellWithIdentifier("ActionCell") else { return UITableViewCell() }
        let action = actions[indexPath.row]
        cell.textLabel?.text = action.humanReadableDescription()
        switch action {
        case .Red:
            cell.textLabel?.textColor = UIColor.redColor()
            break
        case .Green:
            cell.textLabel?.textColor = UIColor.greenColor()
            break
        case .Blue:
            cell.textLabel?.textColor = UIColor.blueColor()
            break
        default:
            cell.textLabel?.textColor = UIColor.blackColor()
        }
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
