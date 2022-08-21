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
    @IBOutlet var paletteLabels: [UILabel]!
    

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
        
        let maxInterationNumber = max(palette.colors.count,
                                      paletteViews.count,
                                      paletteLabels.count)
        
        for index in 0..<maxInterationNumber {
            
            let color = palette.colors[index]
            let colorUI = UIColor(red: getCGFloatColorNumber(from: color[.red]),
                                  green: getCGFloatColorNumber(from: color[.green]),
                                  blue: getCGFloatColorNumber(from: color[.blue]),
                                  alpha: 1.0)
            
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            colorUI.getRed(&red, green: &green, blue: &blue, alpha: nil)
            
            red = round(red * 1000) / 1000
            green = round(red * 1000) / 1000
            blue = round(red * 1000) / 1000
            
            UIView.animate(withDuration: 0.5) {
                
                self.paletteViews[index].backgroundColor = colorUI
                self.paletteLabels[index].text = "red: \(red), green: \(green), blue: \(blue)"
                
            }
        }
        
        
        /*
        zip(paletteViews, palette.colors).forEach { (view, color) in
            let colorUI = UIColor(red: getCGFloatColorNumber(from: color[.red]),
                                  green: getCGFloatColorNumber(from: color[.green]),
                                  blue: getCGFloatColorNumber(from: color[.blue]),
                                  alpha: 1.0)
            
            UIView.animate(withDuration: 0.5) {
                view.backgroundColor = colorUI
            }
        }
        */
    }
    
    private func getCGFloatColorNumber(from eightBitColorNumber: Int?) -> CGFloat {
        return (CGFloat(eightBitColorNumber ?? 1) * CGFloat(1)) / CGFloat(255)
    }
}

