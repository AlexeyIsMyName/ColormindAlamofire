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

    @IBAction func buttonPressed() {
        let url = "http://colormind.io/api/"
        
        AF.request(url, method: .post, parameters: ["model": "default"], encoder: .json)
            .validate()
            .responseDecodable(of: PaletteJSONData.self) { responseData in
                switch responseData.result {
                case .success(let value):
                    let pallete = Palette(paletteJSONDataResult: value.result)
                    DispatchQueue.main.async {
                        self.updateUI(with: pallete)
                    }
                case .failure(let error):
                    print("AFerror", error)
                }
            }
    }
    
    private func updateUI(with palette: Palette) {
        zip(paletteViews, palette.colors).forEach { (view, color) in
            let colorUI = UIColor(red: getCGFloatColorNumber(from: color[.red]),
                                  green: getCGFloatColorNumber(from: color[.green]),
                                  blue: getCGFloatColorNumber(from: color[.blue]),
                                  alpha: 1.0)
            
            view.backgroundColor = colorUI
        }
    }
    
    private func getCGFloatColorNumber(from eightBitColorNumber: Int?) -> CGFloat {
        return (CGFloat(eightBitColorNumber ?? 1) * CGFloat(1)) / CGFloat(255)
    }
}

