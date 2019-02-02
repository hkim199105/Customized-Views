//
//  HKButton.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 30..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

public enum HKButtonType {
    case rect
    case circle
}

class HKButton: UIButton {

    var style: HKButtonType = .rect {
        // Property Observer: automatically called block when the value changes
        didSet {
            switch style {
            case .rect:
                self.backgroundColor = UIColor.black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
                
            case .circle:
                self.backgroundColor = UIColor.red
                self.layer.borderColor = UIColor.gray.cgColor
                self.layer.cornerRadius = 50
                self.layer.borderWidth = 2
                self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    // init method for Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.backgroundColor = UIColor.green
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitle("HKButton built by storyboard", for: .normal)
        self.sizeToFit()
    }
    
    // designated init method overriding parent's method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
        self.setTitle("HKButton built by code", for: .normal)
        self.sizeToFit()
    }
    
    // custom designated init method
    init() {
        // parent's designated init method
        super.init(frame: CGRect.zero)
    }
    
    // convenience init method
    convenience init(type: HKButtonType) {
        // self's designated init method (cause it's convenience init method)
        self.init()
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag)\((sender.tag % 10 == 1 && sender.tag != 11) ? "st": (sender.tag % 10 == 2 && sender.tag != 12) ? "nd" : (sender.tag % 10 == 3 && sender.tag != 13) ? "rd" : "th") click", for: .normal)
    }

}
