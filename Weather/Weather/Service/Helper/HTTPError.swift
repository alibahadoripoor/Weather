//
//  HTTPError.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

enum HTTPError: Error {
    case invalidResponse, noData, failedRequest, invalidData
}
