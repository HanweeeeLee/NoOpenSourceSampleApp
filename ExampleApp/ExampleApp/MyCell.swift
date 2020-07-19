//
//  myCell.swift
//  ExampleApp
//
//  Created by hanwe on 2020/07/19.
//  Copyright © 2020 hanwe. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: property
    
    var data:Dictionary<String,Any>? = nil {
        didSet {
            self.titleLabel.text = data?["name"] as? String
        }
    }
    
    
    //MARK: lifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: function
    
    //MARK: action
    
}
