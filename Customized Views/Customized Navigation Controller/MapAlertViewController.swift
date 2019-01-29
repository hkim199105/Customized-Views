//
//  MapAlertViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 29..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btnAlert = UIButton(type: .system)
        btnAlert.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        btnAlert.center.x = self.view.frame.width / 2
        btnAlert.setTitle("Map Alert", for: .normal)
        btnAlert.addTarget(self, action: #selector(btnAlertClick), for: .touchUpInside)
        self.view.addSubview(btnAlert)
    }
    
    @objc func btnAlertClick(_ sender: UIButton) {
        let mAlert = UIAlertController(title: nil, message: "Are you here?", preferredStyle: .alert)
        
        let btnOk = UIAlertAction(title: "OK", style: .default)
        mAlert.addAction(btnOk)
        
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel)
        mAlert.addAction(btnCancel)
        
        let mView = MapKitViewController()
        mAlert.setValue(mView, forKey: "contentViewController")
        
        self.present(mAlert, animated: false)
    }

}
