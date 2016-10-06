//
//  AppDelegate.swift
//  RGB Remote
//
//  Created by Christian Hatch on 1/28/16.
//  Copyright © 2016 Knot Labs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let tabbarManager = TabbarManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let tabbar = window?.rootViewController as? UITabBarController {
            tabbarManager.setup(tabBarController: tabbar)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


class TabbarManager: NSObject, UITabBarControllerDelegate {
    fileprivate static let userDefaultsKey = "TabbarManagerLastSelectedIndexKey"
    
    static func lastSelectedIndex() -> Int {
        let index = UserDefaults.standard.integer(forKey: TabbarManager.userDefaultsKey)
        return index
    }
    
    static fileprivate func setLastSelectedIndex(_ index: Int) {
        UserDefaults.standard.set(index, forKey: TabbarManager.userDefaultsKey)
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        TabbarManager.setLastSelectedIndex(tabBarController.selectedIndex)
    }
    
    
    func setup(tabBarController tabbar: UITabBarController) {
        
        let rgb = ButtonGridViewController(dataSource: iOSCollectionViewDataSource(dataSource: RGBDataSource()))
        rgb.title = "RGB"
        let rgbww = ButtonGridViewController(dataSource: iOSCollectionViewDataSource(dataSource: RGBWWDataSource()))
        rgbww.title = "RGBWW"
        
        var vcs = tabbar.viewControllers
        vcs?.insert(rgb, at: 0)
        vcs?.insert(rgbww, at: 1)
        tabbar.viewControllers = vcs
        
        if let controllers = tabbar.viewControllers {
            for (index, vc) in controllers.enumerated() {
                let item = tabbar.tabBar.items?[index]
                item?.title = vc.title
                item?.image = UIImage(named: "first")
            }
        }
        
        tabbar.delegate = self
        tabbar.selectedIndex = TabbarManager.lastSelectedIndex()
    }
}





