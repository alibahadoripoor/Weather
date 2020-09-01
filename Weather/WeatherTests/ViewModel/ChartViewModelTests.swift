//
//  ChartViewModelTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class ChartViewModelTests: XCTestCase {

    func testChartViewModel(){
        
        let temp = Temp(temp: 12.0, minTemp: 5.0, maxTemp: 20.0)
        let weather = Weather(name: "Berlin", tempDetails: temp, date: Date())
        let viewModel = ChartViewModel()
        viewModel.weather = weather
        viewModel.tempType = .fahrenheit
        XCTAssertEqual(viewModel.title, "Berlin")
        XCTAssertEqual(viewModel.min, 41.0)
        XCTAssertEqual(viewModel.max, 68.0)
        
    }

}
