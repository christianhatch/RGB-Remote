//
//  TextViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 3/23/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

class TextViewController: UIViewController {
    
    var text: String? {
        didSet {
            textView.text = text
        }
    }
    
    fileprivate var textView: UITextView!
    
    
    init(string: String?) {
        super.init(nibName: nil, bundle: nil)
        text = string
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

extension TextViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Message"
        
        textView = UITextView(frame: view.frame)
        view.addSubview(textView)
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = Style.Color.darkGray.color()
        textView.textColor = Style.Color.textColor.color()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textView.text = text
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

