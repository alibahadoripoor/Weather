//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherViewModelTests: XCTestCase {
    var viewModel: WeatherViewModel!
    
    override func setUp()  {
        viewModel = WeatherViewModel(
            weatherService: WeatherService(dataService: DataServiceMock()),
            locationService: LocationServiceMock()
        )
        viewModel.cityName = "Berlin"
    }

    func testGoButtonDidSelect(){
        let expectation = self.expectation(description: "Go Button Did Select Successfully")

        viewModel.onUpdate = {
            expectation.fulfill()
        }
        
        viewModel.goButtonDidSelect()
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testLocationButtonDidSelect(){
        let expectation = self.expectation(description: "Location Button Did Select Successfully")

        viewModel.onUpdate = {
            expectation.fulfill()
        }
        
        viewModel.locationButtonDidSelect()
        
        waitForExpectations(timeout: 1, handler: nil)
    }

}



