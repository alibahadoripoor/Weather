//
//  DataServiceMock.swift
//  WeatherTests
//
//  Created by Ali Bahadori on 01.09.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import XCTest
@testable import Weather

class DataServiceMock: DataServiceProtocol {
    
    func fetchData(for url: URL, completion: @escaping (Data?, HTTPError?) -> ()) {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        
        do{
            let exampleJSONData = try Data(contentsOf: url)
            completion(exampleJSONData, nil)
        }catch{
            completion(nil, .noData)
        }
    }
    
}
