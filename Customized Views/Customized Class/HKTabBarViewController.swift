//
//  HKTabBarViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 2. 2..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class HKTabBarViewController: UITabBarController {

    let HKView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        // hide default tabbar
        self.tabBar.isHidden = true
        
        // build custom tabbar
        let width = self.view.frame.width
        let height: CGFloat = 50
        let x: CGFloat = 0
        let y = self.view.frame.height - height
        self.HKView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.HKView.backgroundColor = UIColor.brown
        self.view.addSubview(self.HKView)
        
        // build custom tabbaritem
        let tabBtnWidth = self.HKView.frame.size.width / 3
        let tabBtnHeight = self.HKView.frame.size.height
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.addTabBarBtn(btn: tabItem01, title: "First Btn", tag: 0)
        self.addTabBarBtn(btn: tabItem02, title: "Second Btn", tag: 1)
        self.addTabBarBtn(btn: tabItem03, title: "Thrid Btn", tag: 2)
        
        self.onTabBarItemClick(self.tabItem01)
    }
    
    func addTabBarBtn(btn: UIButton, title: String, tag: Int) {
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.blue, for: .selected)
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        self.HKView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        sender.isSelected = true
        
        self.selectedIndex = sender.tag
    }
}
