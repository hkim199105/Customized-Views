//
//  ViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 23..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Chapter 2-1
        // create a button instance and set.
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("Test Button", for: UIControl.State.normal)
        btn.center = CGPoint(x: self.view.frame.width / 2, y: 100)
        
        // add the instance to Root View
        self.view.addSubview(btn)
        
        // link the instance with the action function
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        
        // Chapter 2-2
        // set navigation bar title
        self.navigationItem.title = "Setting"
        
        // create and show labels
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 120, width: 100, height: 30)
        lblEmail.text = "E-mail"
        lblEmail.font = UIFont(name: "Chalkboard SE", size: 14)
        self.view.addSubview(lblEmail)
        
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 160, width: 100, height: 30)
        lblUpdate.text = "Auto Update"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "Update Interval"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 150, y: 120, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.textAlignment = NSTextAlignment.right
        self.paramEmail.adjustsFontSizeToFitWidth = true
        self.paramEmail.autocapitalizationType = UITextAutocapitalizationType.none
        self.paramEmail.placeholder = "ex) abcdefg@zyxw.com"
        self.view.addSubview(self.paramEmail)
        
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 150, y: 160, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.view.addSubview(self.paramUpdate)
        
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 150, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1
        self.paramInterval.value = 0
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        self.view.addSubview(self.paramInterval)
        
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 160, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "To Update"
        self.view.addSubview(self.txtUpdate)
        
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "every 0 minutes"
        self.view.addSubview(self.txtInterval)
        
        // print available font list
        let fonts = UIFont.familyNames      // family name != font name
        for f in fonts {
            let fontName = UIFont.fontNames(forFamilyName: f)
            print("\(f) \(fontName)")
        }
    }

    @objc func btnOnClick(_ sender: Any) {
        if let btn = sender as? UIButton {
            btn.setTitle("It's clicked!", for: UIControl.State.normal)
        }
    }
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "To Update" : "Not to Update")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("every \( Int(sender.value) ) minutes")
    }

}

