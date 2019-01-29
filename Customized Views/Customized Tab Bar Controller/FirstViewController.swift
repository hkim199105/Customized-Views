//
//  FirstViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 29..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lblTitle = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        lblTitle.text = "First Tab"
        lblTitle.textColor = UIColor.red
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.boldSystemFont(ofSize: 14)
        lblTitle.sizeToFit()
        lblTitle.center.x = self.view.frame.width / 2
        self.view.addSubview(lblTitle)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        // replace this with animation
//        tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(0.35), animations: {
            tabBar?.alpha = (tabBar?.alpha == 0) ? 1 : 0
        })
    }
}
