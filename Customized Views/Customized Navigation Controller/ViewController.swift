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
        
        // create a button instance and set.
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("Test Button", for: UIControl.State.normal)
        btn.center = CGPoint(x: self.view.frame.width / 2, y: 100)
        
        // add the instance to Root View
        self.view.addSubview(btn)
        
        // link the instance with the action function
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
        
        // set navigation bar title
//        self.navigationItem.title = "Setting"
        initTitle(titleType: "Chrome")
        
        // create and show labels
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 120, width: 100, height: 30)
        lblEmail.text = "E-mail"
        lblEmail.font = UIFont(name: "SDMiSaeng", size: 14)
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
    
    @objc func submit(_ sender: UIBarButtonItem) {
        let mReadVC = ReadViewController()
        mReadVC.pEmail = self.paramEmail.text
        mReadVC.pUpdate = self.paramUpdate.isOn
        mReadVC.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(mReadVC, animated: true)
    }

    func initTitle(titleType: String) {
        if titleType == "Submit" {
            let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
            self.navigationItem.rightBarButtonItem = submitBtn
            
        } else if titleType == "Two-line String" {
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
            
            let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
            topTitle.numberOfLines = 1
            topTitle.textAlignment = .center
            topTitle.textColor = UIColor.white
            topTitle.font = UIFont.systemFont(ofSize: 15)
            topTitle.text = "58 Rooms"
            
            let bottomTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
            bottomTitle.numberOfLines = 1
            bottomTitle.textAlignment = .center
            bottomTitle.textColor = UIColor.white
            bottomTitle.font = UIFont.systemFont(ofSize: 12)
            bottomTitle.text = "1-night(10 Jan ~ 11 Jan)"
            
            containerView.addSubview(topTitle)
            containerView.addSubview(bottomTitle)
            
            self.navigationItem.titleView = containerView
            
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
            
        } else if titleType == "Image" {
            let imageTitle = UIImageView(image: UIImage(named: "swift_logo"))
            
            self.navigationItem.titleView = imageTitle
            
        } else if titleType == "Chrome" {
            let tfTitle = UITextField()
            tfTitle.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
            tfTitle.backgroundColor = UIColor.white
            tfTitle.font = UIFont.systemFont(ofSize: 13)
            tfTitle.autocapitalizationType = .none
            tfTitle.autocorrectionType = .no
            tfTitle.spellCheckingType = .no
            tfTitle.keyboardType = .URL
            tfTitle.keyboardAppearance = .dark
            tfTitle.layer.borderWidth = 0.3
            tfTitle.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
            
            let backImage = UIImage(named: "arrow-back")
            let leftItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: nil)
            
            let rightView = UIView()
            rightView.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
            
            let cntLabel = UILabel()
            cntLabel.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
            cntLabel.font = UIFont.boldSystemFont(ofSize: 10)
            cntLabel.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
            cntLabel.text = "72"
            cntLabel.textAlignment = .center
            cntLabel.layer.cornerRadius = 3
            cntLabel.layer.borderWidth = 2
            cntLabel.layer.borderColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0).cgColor
            rightView.addSubview(cntLabel)
            
            let moreButton = UIButton(type: .system)
            moreButton.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
            moreButton.setImage(UIImage(named: "more"), for: .normal)
            rightView.addSubview(moreButton)
            
            let rightItem = UIBarButtonItem(customView: rightView)
            
            self.navigationItem.titleView = tfTitle
            self.navigationItem.leftBarButtonItem = leftItem
            self.navigationItem.rightBarButtonItem = rightItem
        }
    }
}

