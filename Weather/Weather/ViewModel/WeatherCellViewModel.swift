//
//  weatherCellViewModel.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

final class WeatherCellViewModel {
    let weather: Weather
    let tempType: TempType
    
    var title: String{
        switch tempType {
        case .fahrenheit:
            let temp = (weather.tempDetails.temp * 1.8) + 32
            return "\(weather.name), \(Int(temp)) \(tempType.rawValue)"
        case .celsius:
            return "\(weather.name), \(Int(weather.tempDetails.temp)) \(tempType.rawValue)"
        }
    }
    
    var date: String{
        guard let date = weather.date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy hh:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    init(weather: Weather, tempType: TempType) {
        self.weather = weather
        self.tempType = tempType
    }
}
