//
//  HKStepper.swift
//  Button Hell
//
//  Created by hkim on 2019. 2. 2..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit
@IBDesignable
public class HKStepper: UIButton {

    public var leftBtn = UIButton(type: .system)
    public var rightBtn = UIButton(type: .system)
    public var centerLabel = UILabel()
    @IBInspectable public var value: Int = 0 { didSet {
        self.centerLabel.text = String(value)
        self.sendActions(for: .valueChanged)
        } }
    @IBInspectable public var leftTitle: String = "↓" { didSet{ self.leftBtn.setTitle(leftTitle, for: .normal) } }
    @IBInspectable public var rightTitle: String = "↑" { didSet{ self.rightBtn.setTitle(rightTitle, for: .normal) } }
    @IBInspectable public var bgColor: UIColor = UIColor.cyan { didSet { self.centerLabel.backgroundColor = bgColor } }
    @IBInspectable public var stepInterval: Int = 1 { didSet {
            self.leftBtn.tag = -stepInterval
            self.rightBtn.tag = stepInterval
    } }
    @IBInspectable public var maxValue: Int = 100
    @IBInspectable public var minValue: Int = -100
    let borderWidth: CGFloat = 0.5
    let borderColor = UIColor.blue.cgColor
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    private func setup() {
        self.leftBtn.tag = -1
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.leftBtn.layer.borderWidth = borderWidth
        self.leftBtn.layer.borderColor = borderColor
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.addSubview(leftBtn)
        
        self.rightBtn.tag = 1
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.rightBtn.layer.borderWidth = borderWidth
        self.rightBtn.layer.borderColor = borderColor
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.addSubview(rightBtn)
        
        self.centerLabel.text = String(value)
        self.centerLabel.font = UIFont.systemFont(ofSize: 16)
        self.centerLabel.textAlignment = .center
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth
        self.centerLabel.layer.borderColor = borderColor
        self.addSubview(centerLabel)
    }
    
    // called when the view size changes
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        var btnWidth: CGFloat
        if (self.frame.height > self.frame.width / 3) {
            btnWidth = self.frame.width / 3
        } else {
            btnWidth = self.frame.height
        }
        let btnHeight = btnWidth
        let lblWidth = self.frame.width - (btnWidth * 2)
        let lblHeight = btnWidth
        let btnTop = (self.frame.height - btnHeight) / 2
        let lblTop = (self.frame.height - lblHeight) / 2
        
        self.leftBtn.frame = CGRect(x: 0, y: btnTop, width: btnWidth, height: btnHeight)
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: btnTop, width: btnWidth, height: btnHeight)
        self.centerLabel.frame = CGRect(x: btnWidth, y: lblTop, width: lblWidth, height: lblHeight)
    }
    
    @objc public func valueChange(_ sender: UIButton) {
        let sum = self.value + sender.tag
        if sum > self.maxValue || sum < self.minValue {
            return
        }
        
        self.value = sum
    }
}
