//
//  WeatherService.swift
//  Weather
//
//  Created by Ali Bahadori on 26.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

typealias WeatherCompletion = (Weather?, HTTPError?) -> ()

protocol WeatherServiceProtocol: class {
    func getWeatherForCity(with name: String, completion: @escaping WeatherCompletion)
    func getWeatherForCurrentLocation(with location: Location, completion: @escaping WeatherCompletion)
}

final class WeatherService: WeatherServiceProtocol {
    private var dataService: DataServiceProtocol!
    
    private var urlBuilder: URLComponents = {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = "https"
        urlBuilder.host = "api.openweathermap.org"
        urlBuilder.path = "/data/2.5/weather"
        return urlBuilder
    }()
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    
    func getWeatherForCity(with name: String, completion: @escaping WeatherCompletion) {
        urlBuilder.queryItems = [
            URLQueryItem(name: "q", value: name),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "a3f1dd1a6b95833c3d0b4fddc512ee76")
        ]
        
        guard let url = urlBuilder.url else { return }
        getWeather(with: url, completion: completion)
    }
    
    func getWeatherForCurrentLocation(with location: Location, completion: @escaping WeatherCompletion) {
        urlBuilder.queryItems = [
            URLQueryItem(name: "lat", value: "\(location.latitude)"),
            URLQueryItem(name: "lon", value: "\(location.longitude)"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "a3f1dd1a6b95833c3d0b4fddc512ee76")
        ]
        
        guard let url = urlBuilder.url else { return }
        getWeather(with: url, completion: completion)
    }
    
    private func getWeather(with url: URL, completion: @escaping WeatherCompletion){
        
        dataService.fetchData(for: url) { (data, err) in
            
            guard err == nil else{
                completion(nil, err)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                var weather: Weather = try decoder.decode(Weather.self, from: data)
                weather.date = Date()
                completion(weather, nil)
            } catch {
                debugPrint("Unable to decode data: \(error.localizedDescription)")
                completion(nil, .invalidData)
            }
            
        }
        
    }
    
}
