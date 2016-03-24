//
//  TextViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/23/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation

class TextViewController: UIViewController {
    
    var text: String?
    
    private var textView: UITextView!
    
    
    init(string: String?) {
        super.init(nibName: nil, bundle: nil)
        text = string
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

extension TextViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Message"
        
        textView = UITextView(frame: view.frame)
        view.addSubview(textView)
        textView.editable = false
        textView.font = UIFont.systemFontOfSize(16)
        textView.backgroundColor = Style.Color.BackgroundColor.uicolor()
        textView.textColor = Style.Color.TextColor.uicolor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        textView.text = text
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

