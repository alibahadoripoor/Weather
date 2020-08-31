//
//  ChartViewModel.swift
//  Weather
//
//  Created by Ali Bahadori on 31.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import Foundation

final class ChartViewModel{
    var coordinator: ChartCoordinator?
    var weather: Weather?
    var tempType: TempType!
    
    var min: Double{
        guard let weather = weather , let tempType = tempType else { return 0 }
        
        if tempType == .fahrenheit{
            let max = (weather.tempDetails.minTemp * 1.8) + 32
            return Double(Int(max))
        }else{
            return Double(Int(weather.tempDetails.minTemp))
        }
    }
    
    var max: Double{
        guard let weather = weather , let tempType = tempType else { return 0 }
        
        if tempType == .fahrenheit{
            let max = (weather.tempDetails.maxTemp * 1.8) + 32
            return Double(Int(max))
        }else{
            return Double(Int(weather.tempDetails.maxTemp))
        }
    }
    
    var title: String{
        guard let weather = weather else { return ""}
        return weather.name
    }
    
    func viewDidDisappear(){
        coordinator?.didFinishChartViewController()
    }
    
    deinit {
        debugPrint("deinit from Chart ViewModel")
    }
}
