//
//  WifiViewController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/14/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit
import ColorMix

class WifiViewController: UIViewController {
    fileprivate var isOn = true
    fileprivate var devices: [WifiDevice] = []
    fileprivate var controllers: [WifiController] {
        return devices.map{WifiController(ipAddress: $0.ipAddress)}
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    @IBAction func togglePowerTapped(_ sender: AnyObject) {
        let command: WifiCommand = isOn ? .off : .on
        controllers.forEach{$0.send(command: command)}
        isOn = !isOn
    }
    
    @IBAction func redButtonTapped(_ sender: AnyObject) {
        
        let discover = WifiDeviceDiscoverer(timeout: 1)
        discover.discover { (result) in
            switch result {
            case .devices(let devices):
                guard devices.count > 0 else {
                    self.statusLabel.text = "No Devices Found"
                    return
                }
                self.statusLabel.text = devices.map{$0.asString()}.reduce("", { $0 == "" ? $1 : $0 + "\n\n" + $1 })
                self.devices = devices
                
            case .error(let error):
                self.statusLabel.text = error.localizedDescription
            }
        }

    }
    
    @IBAction func selectColorTapped(_ sender: AnyObject) {
        let vc = ColorPickerViewController(delegate: self)
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    @objc fileprivate func done() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - UIKit

extension WifiViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Style.Color.darkGray.color()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

extension WifiViewController: ColorPickerViewDelegate {
    
    func colorPickerView(_ view: ColorPickerView, pickedColorDidChange color: UIColor) {
        
    }
    
    func colorPickerViewUserFinishedInteracting(_ view: ColorPickerView) {
        print(#function)
        controllers.forEach{$0.send(command: .color(view.pickedColor, true))}
    }
}
















