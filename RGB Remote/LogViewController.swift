//
//  LogViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/23/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class LogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
}

extension LogViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.Color.BackgroundColor.uicolor()
        tableView.backgroundColor = Style.Color.BackgroundColor.uicolor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LogViewController.reloadAndScrollToBottom), name: LoggerNotification.NewMessage.rawValue, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadAndScrollToBottom()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


extension LogViewController {
    
    func reloadAndScrollToBottom() {
        tableView.reloadData()
        
        guard Logger.sharedLogger.messages.count > 0 else { return }
        
        let indexPath = NSIndexPath(forRow: Logger.sharedLogger.messages.count-1, inSection: 0)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
    }
}


extension LogViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let text = Logger.sharedLogger.messages[indexPath.row]

        let textvc = TextViewController(string: text)
        navigationController?.pushViewController(textvc, animated: true)
    }
}

extension LogViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Logger.sharedLogger.messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LoggerCell", forIndexPath: indexPath)
        
        let text = Logger.sharedLogger.messages[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = Style.Color.TextColor.uicolor()
        
        cell.contentView.backgroundColor = Style.Color.BackgroundColor.uicolor()
        cell.backgroundColor = Style.Color.BackgroundColor.uicolor()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
}



