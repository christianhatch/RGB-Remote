//
//  TabBarController.swift
//  RGB Remote
//
//  Created by Christian Hatch on 10/14/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import Foundation
import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

extension TabbarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupView() {
            let rgbww = IRButtonGridViewController(dataSource: IRRemoteDataSource(remoteControl: RGBWWRemoteControl()))
            rgbww.title = "RGBWW"
//            let wifi = WifiDeviceListViewController()
//            wifi.title = "Wifi"
            
            var vcs = viewControllers
            vcs?.insert(rgbww, at: 0)
//            vcs?.append(wifi)
            viewControllers = vcs
            
            if let controllers = viewControllers {
                for (index, vc) in controllers.enumerated() {
                    let item = tabBar.items?[index]
                    item?.title = vc.title
                    item?.image = UIImage(named: "first")
                }
            }
            
            delegate = self
            selectedIndex = TabbarController.lastSelectedIndex()
        }
        
        setupView()
    }

    
    
    @objc(tabBarController:didSelectViewController:) func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        TabbarController.setLastSelectedIndex(tabBarController.selectedIndex)
    }
}


//saving and such 

extension TabbarController {
    
    fileprivate static let userDefaultsKey = "TabbarManagerLastSelectedIndexKey"
    
    static func lastSelectedIndex() -> Int {
        let index = UserDefaults.standard.integer(forKey: TabbarController.userDefaultsKey)
        return index
    }
    
    static fileprivate func setLastSelectedIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: TabbarController.userDefaultsKey)
    }
    
    
}








