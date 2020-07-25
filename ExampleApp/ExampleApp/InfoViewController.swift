//
//  InfoViewController.swift
//  ExampleApp
//
//  Created by hanwe on 2020/07/25.
//  Copyright © 2020 hanwe. All rights reserved.
//

import UIKit
import SwiftyJSON
//todo 구글지도로 마커찍기
class InfoViewController: UIViewController {

    //todo 디자인하기
    @IBOutlet weak var label: UILabel!
    
//    var data:[String:Any]? = nil {
//        didSet {
////            label.text = data![""]
//            print("dhqwdhwqhj \(data!))")
//
//        }
//    }
    var data:JSON = JSON.null {
        didSet {
            print("data:\(data)")
            print("test:\(data["main"]["temp_min"].intValue)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = String(converteKelvinToCelsius(input: data["main"]["temp_min"].floatValue))
        
    }
    func converteKelvinToCelsius(input:Float) -> Float {
        return input - 273.5
    }

}
