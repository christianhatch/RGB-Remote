//
//  ColorPickerViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/20/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import ColorMix


class ColorPickerViewController: UIViewController {
    
    fileprivate lazy var colorPicker: ColorPickerView = {
        let v = ColorPickerView(frame: .zero, delegate: self)
        return v!
    }()
    @IBOutlet fileprivate var delegate: ColorPickerViewDelegate!
    
    
    init(delegate: ColorPickerViewDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


//MARK: - UIKit 

extension ColorPickerViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(colorPicker)
        colorPicker.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.bottom.equalTo(bottomLayoutGuide.snp.top)
            
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }
    
}


extension ColorPickerViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ view: ColorPickerView, pickedColorDidChange color: UIColor) {
        delegate.colorPickerView?(view, pickedColorDidChange: color)
        self.view.backgroundColor = color
    }
    
    func colorPickerViewUserFinishedInteracting(_ view: ColorPickerView) {
        delegate.colorPickerViewUserFinishedInteracting?(view)
    }
}
