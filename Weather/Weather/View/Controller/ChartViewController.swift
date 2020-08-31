//
//  ChartViewController.swift
//  Weather
//
//  Created by Ali Bahadori on 30.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit
import Charts

final class ChartViewController: UIViewController {

    var viewModel: ChartViewModel!
    
    private let chartView = BarChartView()
    
    private var windowInterfaceOrientation: UIInterfaceOrientation? {
        return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    deinit {
        debugPrint("deinit from Chart View Controller")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupChartViewLayout()
    }
    
    private func configureUI(){
        view.backgroundColor = .white
        title = viewModel.title
        
        setupChartView(with: view.frame.width)
        setChartData()
        
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidSelect))
        navigationItem.rightBarButtonItem = cancelBarButton
        navigationController?.navigationBar.barTintColor = .myBlue
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func cancelButtonDidSelect(){
        dismiss(animated: true, completion: nil)
    }
    
    private func setupChartView(with width: CGFloat){
        chartView.xAxis.enabled = false
        chartView.rightAxis.enabled = false
        setupChartViewLayout()
        view.addSubview(chartView)
        
    }
    
    private func setupChartViewLayout(){
        guard let windowInterfaceOrientation = self.windowInterfaceOrientation else { return }
        guard let navBarHeight = navigationController?.navigationBar.frame.size.height else { return }
        
        if windowInterfaceOrientation.isLandscape {
            let height = view.frame.height - navBarHeight - 40
            chartView.frame = .init(x: 0, y: navBarHeight, width: height, height: height)
        } else {
            let width = view.frame.width - 20
            chartView.frame = .init(x: 0, y: navBarHeight, width: width, height: width)
        }
        
        chartView.center = view.center
    }
    
    private func setChartData(){
        let minEntry = BarChartDataEntry(x: 1, y: viewModel.min)
        let maxEntry = BarChartDataEntry(x: 2, y: viewModel.max)
        let entries = [minEntry, maxEntry]
        
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = ChartColorTemplates.material()
        dataSet.label = "Minimum Temperature, Maximum Temperature"
        
        let data = BarChartData(dataSet: dataSet)
        chartView.data = data
    }
    
}
