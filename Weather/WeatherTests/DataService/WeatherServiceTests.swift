//
//  WeatherServiceTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherServiceTests: XCTestCase {

    var weatherService: WeatherServiceProtocol!
    
    override func setUp() {
        weatherService = WeatherService(dataService: DataServiceMock())
    }
    
    func testGetWeatherForCity(){
        weatherService.getWeatherForCity(with: "Berlin") { (weather, error) in
            guard let weather = weather else { return }
            XCTAssertEqual(weather.name, "Berlin")
            XCTAssertEqual(weather.tempDetails.temp, 18.58)
            XCTAssertEqual(weather.tempDetails.minTemp, 18)
            XCTAssertEqual(weather.tempDetails.maxTemp, 18.89)
        }
    }
    
    func testGetWeatherForCurrentLocation(){
        let location = Location(latitude: 52.52, longitude: 13.41)
        weatherService.getWeatherForCurrentLocation(with: location) { (weather, error) in
            guard let weather = weather else { return }
            XCTAssertEqual(weather.name, "Berlin")
            XCTAssertEqual(weather.tempDetails.temp, 18.58)
            XCTAssertEqual(weather.tempDetails.minTemp, 18)
            XCTAssertEqual(weather.tempDetails.maxTemp, 18.89)
        }
    }

}
