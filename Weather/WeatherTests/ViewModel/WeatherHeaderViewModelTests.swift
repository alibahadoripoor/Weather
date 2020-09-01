//
//  WeatherHeaderViewModelTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherHeaderViewModelTests: XCTestCase {
    
    func testWeatherHeaderViewModel(){
        
        let temp = Temp(temp: 12.0, minTemp: 5.0, maxTemp: 20.0)
        let weather = Weather(name: "Berlin", tempDetails: temp, date: Date())
        let weatherHeader = WeatherHeaderViewModel(weather: weather, tempType: .fahrenheit)
        XCTAssertEqual(weatherHeader.name, "Berlin")
        XCTAssertEqual(weatherHeader.temp, "53 °F")
        XCTAssertEqual(weatherHeader.backgroundColor, UIColor.myOrange)
        
    }
    
}
