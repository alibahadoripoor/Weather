//
//  Alert.swift
//  Weather
//
//  Created by Ali Bahadori on 30.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

struct Alert{
    static let locationAccessIsDenied = ("Location access is denied", "This app needs to access to the location for this feature")
    static let locationRequestWasFailed = ("Location request was failed", "The request for the location was failed please try again")
    static let cityNotFound = ("City not found", "Please enter the right city name and try again")
    static let connectionWasLost = ("Connection was lost", "Please check your internet connection and try again")
}
