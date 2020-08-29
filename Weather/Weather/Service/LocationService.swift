//
//  LocationService.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation
import CoreLocation

typealias LocationCompletion = (Location?, Error?) -> ()

protocol LocationServiceProtocol: class {
    func retriveCurrentLocation(completion: @escaping LocationCompletion)
}

final class LocationService: NSObject, CLLocationManagerDelegate, LocationServiceProtocol {
    private var completion: LocationCompletion?
    
    lazy private var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        return locationManager
    }()
    
    func retriveCurrentLocation(completion: @escaping LocationCompletion){
        self.completion = completion
        
        let status = CLLocationManager.authorizationStatus()
        
        if(status == .denied || status == .restricted || !CLLocationManager.locationServicesEnabled()){
            // show alert to user telling them they need to allow location data to use some feature of your app
            return
        }
        
        // if haven't show location permission dialog before, show it to user
        if(status == .notDetermined){
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // request location data once
        locationManager.requestLocation()
    }
    
    //MARK: Location Manager Delegates
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let location = Location(latitude: locValue.latitude, longitude: locValue.longitude)
        completion?(location, nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(nil, error)
    }
}
