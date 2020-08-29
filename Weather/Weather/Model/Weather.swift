//
//  Weather.swift
//  Weather
//
//  Created by Ali Bahadori on 26.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

struct Weather : Codable{
    let name: String
    let tempDetails: Temp
    var date: Date?
    
    enum CodingKeys: String, CodingKey{
        case name
        case tempDetails = "main"
        case date
    }
}

struct Temp : Codable{
    let temp: Float
    let minTemp: Float
    let maxTemp: Float
    
    enum CodingKeys: String, CodingKey{
        case temp
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
