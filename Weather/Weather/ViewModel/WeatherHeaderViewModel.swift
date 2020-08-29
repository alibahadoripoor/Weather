//
//  WeatherHeaderViewModel.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class WeatherHeaderViewModel {
    let weather: Weather
    let tempType: TempType
    
    var name: String{
        return weather.name
    }

    var temp: String{
        switch tempType {
        case .fahrenheit:
            let temp = (weather.tempDetails.temp * 1.8) + 32
            return "\(Int(temp)) \(tempType.rawValue)"
        case .celsius:
            return "\(Int(weather.tempDetails.temp)) \(tempType.rawValue)"
        }
    }
    
    var backgroundColor: UIColor{
        let temp = weather.tempDetails.temp
        if temp < 10.00 {
            return .myLightBlue
        }else if temp < 25.00 {
            return .myOrange
        }else{
            return .myRed
        }
    }
    
    init(weather: Weather, tempType: TempType) {
        self.weather = weather
        self.tempType = tempType
    }
}
