//
//  ViewController.swift
//  ExampleApp
//
//  Created by hanwe on 2020/07/19.
//  Copyright © 2020 hanwe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: property
    
    var weatherQueryInfoArr:Array<Any>? = nil
    
    
    //MARK: lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        weatherQueryInfoArr = readJsonFile()
//        initUI()
        getTest2()
    }
    
    //MARK function
    
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
    
    func getTest2() {
        ApiManager.query(url: "http://api.openweathermap.org/data/2.5/weather?id=6359862&appid=ed30f1d93596934d60d66e095f34b2ce",
                         function: .get,
                         param: nil,
                         requestType: .json,
                         responseType: .json,
                         timeout: 60,
                         completeHanlder: { (response) in
                            print("data:\(String(describing: String(data: response, encoding: .utf8)))")
        }) { (err) in
            print("err:\(err.localizedDescription)")
        }
    }
    
    func initUI() {
        self.backgroundView.backgroundColor = .clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }
    
    func readJsonFile() -> Array<Any> {
        var resultArr:Array = Array<Any>()
        
        if let path = Bundle.main.path(forResource: "cityList", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                resultArr = try (JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! Array<Any>)
            } catch {
                print("json 파일 읽기 실패")
            }
        }
        return resultArr
    }
    
    func converteKelvinToCelsius(input:Float) -> Float {
        return input - 273.5
    }
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherQueryInfoArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        let data:Dictionary? = weatherQueryInfoArr?[indexPath.row] as? [String:Any]
        cell.data = data
        return cell
    }
    
    
}
