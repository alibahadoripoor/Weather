//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

final class WeatherViewModel {
    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol
    
    var onUpdate: () -> () = {}
    var cityName: String = ""
    var tempType: TempType = .celsius
    var header: WeatherHeaderViewModel!
    var cells: [WeatherCellViewModel] = []
    
    init(weatherService: WeatherServiceProtocol = WeatherService(),
         locationService: LocationServiceProtocol = LocationService()) {
        self.weatherService = weatherService
        self.locationService = locationService
    }
    
    func goButtonDidSelect(){
        guard cityName != "" else { return }
        weatherService.getWeatherForCity(
            with: cityName, completion: self.weatherCompletionHandler(weather: error:)
        )
    }
    
    func locationButtonDidSelect(){
        locationService.retriveCurrentLocation { [weak self] (location, err) in
            guard let self = self, err == nil else { return }
            guard let location = location else { return }
            self.weatherService.getWeatherForCurrentLocation(
                with: location, completion: self.weatherCompletionHandler(weather: error:)
            )
        }
    }
    
    func tempTypeSwitchValueChanged(with type: TempType){
        tempType = type
        guard header != nil else { return }
        header = WeatherHeaderViewModel(weather: header.weather, tempType: type)
        cells = cells.map({ WeatherCellViewModel(weather: $0.weather, tempType: type) })
        onUpdate()
    }
    
    func chartButtonDidSelect(at index: Int){
        
    }
    
    private func weatherCompletionHandler(weather: Weather?, error: Error?){
        guard error == nil else {
            //Here we can handel the error
            return
        }
        
        guard let weather = weather else { return }
        header = WeatherHeaderViewModel(weather: weather, tempType: tempType)
        cells.insert(WeatherCellViewModel(weather: weather, tempType: tempType), at: 0)
        onUpdate()
    }
}


