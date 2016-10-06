//
//  SecondViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit

class ButtonListViewController: UIViewController {
    fileprivate let actions = Command.rgbww
}

extension ButtonListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}



//MARK: - TableView Delegate

extension ButtonListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell", for: indexPath)
        
        let action = actions[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = action.humanReadableDescription()
        cell.textLabel?.textColor = action.color()

        return cell
    }
}


//MARK: - TableView DataSource 

extension ButtonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        APIManager.sendCommand(actions[(indexPath as NSIndexPath).row])
    }
}







