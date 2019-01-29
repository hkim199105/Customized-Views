//
//  ListViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 30..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var delegate: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredContentSize.height = 220
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 500
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mCell = UITableViewCell()
        mCell.textLabel!.text = "\(indexPath.row)\((indexPath.row % 10 == 1 && indexPath.row / 10 != 1) ? "st" : (indexPath.row % 10 == 2 && indexPath.row / 10 != 1) ? "nd" : (indexPath.row % 10 == 3 && indexPath.row / 10 != 1) ? "rd" : "th") option"
        mCell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        
        return mCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAt(indexPath: indexPath)
    }
}
