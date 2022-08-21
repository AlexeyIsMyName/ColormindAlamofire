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
    let colorOne: (red: Int, green: Int, blue: Int)
    let colorTwo: (red: Int, green: Int, blue: Int)
    let colorThree: (red: Int, green: Int, blue: Int)
    let colorFour: (red: Int, green: Int, blue: Int)
    let colorFive: (red: Int, green: Int, blue: Int)
    
}
