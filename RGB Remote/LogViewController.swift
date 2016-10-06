//
//  LogViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/23/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

class LogViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
}

extension LogViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.Color.backgroundColor.color()
        tableView.backgroundColor = Style.Color.backgroundColor.color()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadAndScrollToBottom), name: NSNotification.Name(rawValue: LoggerNotification.NewMessage.rawValue), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadAndScrollToBottom()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}


extension LogViewController {
    
    func reloadAndScrollToBottom() {
        tableView.reloadData()
        
        guard Logger.sharedLogger.messages.count > 0 else { return }
        
        let indexPath = IndexPath(row: Logger.sharedLogger.messages.count-1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}


extension LogViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = Logger.sharedLogger.messages[(indexPath as NSIndexPath).row]

        let textvc = TextViewController(string: text)
        navigationController?.pushViewController(textvc, animated: true)
    }
}

extension LogViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Logger.sharedLogger.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LoggerCell", for: indexPath)
        
        let text = Logger.sharedLogger.messages[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = Style.Color.textColor.color()
        
        cell.contentView.backgroundColor = Style.Color.backgroundColor.color()
        cell.backgroundColor = Style.Color.backgroundColor.color()
        return cell
    }
    
    @objc(tableView:heightForRowAtIndexPath:) func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}









