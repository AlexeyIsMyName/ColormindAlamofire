//
//  Palette.swift
//  ColormindAlamofire
//
//  Created by ALEKSEY SUSLOV on 21.08.2022.
//

struct PaletteJSONData: Decodable {
    let result: [[Int]]
}

struct Palette {
    enum ColorSet: String, CaseIterable {
        case red, green, blue
    }
    
    var colors: [[ColorSet: Int]]
                 
    init(paletteJSONDataResult: [[Int]]) {
        var colors = [[Palette.ColorSet: Int]]()
        
        for paletteColors in paletteJSONDataResult {
            var color = [Palette.ColorSet: Int]()
            for index in 0..<paletteColors.count {
                color[ColorSet.allCases[index]] = paletteColors[index]
            }
            colors.append(color)
        }
        
        self.colors = colors
    }
}
