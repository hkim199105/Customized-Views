//
//  ReadViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 23..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {

    var pEmail: String?
    var pUpdate: Bool?
    var pInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let lblEmail = UILabel()
        let lblUpdate = UILabel()
        let lblInterval = UILabel()
        lblEmail.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        lblUpdate.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        lblInterval.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        lblEmail.text = "Received Email: \( self.pEmail! )"
        lblUpdate.text = "\( self.pUpdate == true ? "Auto Updating" : "Not Updating" )"
        lblInterval.text = "Update Interval: every \( self.pInterval! ) minutes"
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(lblInterval)
        
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
