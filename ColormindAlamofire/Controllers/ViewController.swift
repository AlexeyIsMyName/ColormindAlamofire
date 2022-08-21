//
//  ViewController.swift
//  ColormindAlamofire
//
//  Created by ALEKSEY SUSLOV on 21.08.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed() {
        let url = "http://colormind.io/api/"
        
        AF.request(url, headers: ["model": "default"])
            .response { responseData in
                print("DATA: ", responseData)
            }
    }
    
}

