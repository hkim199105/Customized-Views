//
//  ThirdViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 29..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let lblTitle = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        lblTitle.text = "Third Tab"
        lblTitle.textColor = UIColor.red
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont.boldSystemFont(ofSize: 14)
        lblTitle.sizeToFit()
        lblTitle.center.x = self.view.frame.width / 2
        self.view.addSubview(lblTitle)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
