//
//  ChartCoordinator.swift
//  Weather
//
//  Created by Ali Bahadori on 31.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class ChartCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    
    var parentViewController: WeatherViewController?
    var parentCoordinator: WeatherCoordinator?
    
    var weather: Weather!
    var tempType: TempType!
    
    func start() {
        let viewModel = ChartViewModel()
        viewModel.weather = weather
        viewModel.tempType = tempType
        viewModel.coordinator = self
        let chartVC = ChartViewController()
        chartVC.viewModel = viewModel
        let navController = UINavigationController(rootViewController: chartVC)
        parentViewController?.present(navController, animated: true, completion: nil)
    }
    
    func didFinishChartViewController(){
        parentCoordinator?.childDidFinish(self)
    }
    
    deinit {
        debugPrint("deinit from Chart Coordinator")
    }
}
