//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 31.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    
    func testDataServiceConnection() {
        let expectation = self.expectation(description: "Data Service Connection is OK")
        let url = URL(string: "https://api.openweathermap.org/")!
        
        DataService().fetchData(for: url) { (data, err) in
            if data != nil{
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 8, handler: nil)
    }
    
}
