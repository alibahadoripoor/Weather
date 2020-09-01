//
//  LocationServiceMock.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class LocationServiceMock: LocationServiceProtocol {
   
    func retriveCurrentLocation(completion: @escaping LocationCompletion) {
        let location = Location(latitude: 52.52, longitude: 13.41)
        completion(location, nil)
    }

}
