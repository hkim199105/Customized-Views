//
//  CustomizedAppDelegate.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 29..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

// attribute to make system recognize this file as the App Delegate
//@UIApplicationMain

// UIResponder: Class
// UIApplicationDelegate: Protocol
class CustomizedAppDelegate: UIResponder, UIApplicationDelegate {
    // must be defined as below
    // variable to save the object loaded from a storyboard file
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let tbC = UITabBarController()
        tbC.view.backgroundColor = .white
        
        self.window?.rootViewController = tbC
        
        let tab01 = FirstViewController()
        let tab02 = SecondViewController()
        let tab03 = ThirdViewController()
        
        tbC.setViewControllers([tab01, tab02, tab03], animated: false)
        tab01.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        tab02.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        tab03.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
    }
}
