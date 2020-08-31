//
//  WeatherCoordinator.swift
//  Weather
//
//  Created by Ali Bahadori on 31.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: class{
    var childCoordinators: [CoordinatorProtocol] { get }
    func start()
}

final class WeatherCoordinator: CoordinatorProtocol{
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let weatherVC = WeatherViewController()
        let viewModel = WeatherViewModel()
        viewModel.coordinator = self
        weatherVC.viewModel = viewModel
        window.rootViewController = weatherVC
        window.makeKeyAndVisible()
    }
    
    func showChartViewController(for weather: Weather, tempType: TempType){
        let chartCoordinator = ChartCoordinator()
        chartCoordinator.parentViewController = window.rootViewController as? WeatherViewController
        chartCoordinator.parentCoordinator = self
        chartCoordinator.weather = weather
        chartCoordinator.tempType = tempType
        childCoordinators.append(chartCoordinator)
        chartCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: CoordinatorProtocol){
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
