//
//  ViewController.swift
//  ColormindAlamofire
//
//  Created by ALEKSEY SUSLOV on 21.08.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var paletteViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonPressed() {
        let url = "http://colormind.io/api/"
        
        AF.request(url, method: .post, parameters: ["model": "default"], encoder: .json)
            .validate()
            .responseDecodable(of: PaletteJSONData.self) { responseData in
                switch responseData.result {
                case .success(let value):
                    print("AFvalue", value)
                case .failure(let error):
                    print("AFerror", error)
                }
            }
    }
}

