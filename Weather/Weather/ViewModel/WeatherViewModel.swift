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
    
    var coordinator: WeatherCoordinator?
    
    private var weathers: [Weather] = []
    var header: WeatherHeaderViewModel!
    var cells: [WeatherCellViewModel] = []
    var cityName: String = ""
    var tempType: TempType = .celsius
    var onUpdate: () -> () = {}
    var onShowAlert: (String, String) -> () = { _,_ in }
    
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
        locationService.retriveCurrentLocation { [weak self] (location, error) in
            guard let self = self else { return }
            
            if let error = error{
                if error == .accessDenied{
                    self.onShowAlert(Alert.locationAccessIsDenied.0, Alert.locationAccessIsDenied.1)
                }else if error == .failedRequest{
                    self.onShowAlert(Alert.locationRequestWasFailed.0, Alert.locationRequestWasFailed.1)
                }
            }
            
            if let location = location {
                self.weatherService.getWeatherForCurrentLocation(
                    with: location, completion: self.weatherCompletionHandler(weather: error:)
                )
            }
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
        coordinator?.showChartViewController(for: weathers[index], tempType: tempType)
    }
    
    private func weatherCompletionHandler(weather: Weather?, error: HTTPError?){
        if let error = error {
            if error == .invalidResponse{
                onShowAlert(Alert.cityNotFound.0, Alert.cityNotFound.1)
            }else{
                onShowAlert(Alert.connectionWasLost.0, Alert.connectionWasLost.1)
            }
            return
        }
        
        guard let weather = weather else { return }
        weathers.insert(weather, at: 0)
        header = WeatherHeaderViewModel(weather: weather, tempType: tempType)
        cells.insert(WeatherCellViewModel(weather: weather, tempType: tempType), at: 0)
        onUpdate()
    }
}



