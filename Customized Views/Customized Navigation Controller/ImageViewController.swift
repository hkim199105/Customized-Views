//
//  ImageViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 30..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageStar = UIImage(named: "rating5")
        let viewStar = UIImageView(image: imageStar)
        viewStar.frame = CGRect(x: 0, y: 0, width: (imageStar?.size.width)!, height: (imageStar?.size.height)!)
        self.view.addSubview(viewStar)
        self.preferredContentSize = CGSize(width: (imageStar?.size.width)!, height: (imageStar?.size.height)! + 20)
    }
}
