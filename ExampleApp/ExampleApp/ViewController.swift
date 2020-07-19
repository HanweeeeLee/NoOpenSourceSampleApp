//
//  ViewController.swift
//  ExampleApp
//
//  Created by hanwe on 2020/07/19.
//  Copyright © 2020 hanwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTest() {
        ApiManager.query(url: "https://itunes.apple.com/search/media=music&entity=song&term=test",
                         function: .get,
                         param: nil,
                         requestType: .html,
                         responseType: .html,
                         timeout: 60,
                         completeHanlder: { (response) in
                            print("data:\(String(describing: String(data: response, encoding: .utf8)))")
        }) { (err) in
            print("err:\(err.localizedDescription)")
        }
    }
    
    
}
