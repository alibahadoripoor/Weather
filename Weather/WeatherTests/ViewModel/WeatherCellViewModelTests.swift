//
//  WeatherCellViewModelTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherCellViewModelTests: XCTestCase {

    func testWeatherCellViewModel(){
        
        let temp = Temp(temp: 12.0, minTemp: 5.0, maxTemp: 20.0)
        let weather = Weather(name: "Berlin", tempDetails: temp, date: Date())
        let weatherCell = WeatherCellViewModel(weather: weather, tempType: .fahrenheit)
        XCTAssertEqual(weatherCell.title, "Berlin, 53 °F")
        XCTAssertNotNil(weatherCell.date)
        
    }
    
}
