//
//  ControlViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 30..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {

    private let mSlider = UISlider()
    var sliderValue: Float {
        return self.mSlider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mSlider.minimumValue = 0
        self.mSlider.maximumValue = 100
        self.mSlider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(mSlider)
        self.preferredContentSize = CGSize(width: self.mSlider.frame.width, height: self.mSlider.frame.height + 20)
    }
}
