//
//  ViewController.swift
//  Weather
//
//  Created by Ali Bahadori on 26.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class WeatherViewController: UIViewController {

    var viewModel: WeatherViewModel!
    
    private var searchView = SearchView()
    private var tableView = UITableView()
    private let headerView = WeatherHeader()
    private let cellId = "WeatherCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        viewModel.onUpdate = { [weak self] in
            guard let self = self else { return }
            self.headerView.updateHeader(with: self.viewModel.header)
            self.tableView.reloadData()
        }
    }

}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .white
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherCell
        cell.updateCell(with: viewModel.cells[indexPath.item])
        cell.index = indexPath.item
        cell.parent = self
        return cell
    }
    
}

extension WeatherViewController{
    
    private func configureUI(){
        view.backgroundColor = .myBlue
        setupSearchView()
        setupHeaderView()
        setupTableView()
        hideKeyboard()
    }
    
    private func setupSearchView(){
        view.addSubview(searchView)
        searchView.pinToTop(view, height: 70)
        searchView.parent = self
    }
    
    private func setupHeaderView(){
        view.addSubview(headerView)
        headerView.pinToView(view, topView: searchView, height: 160)
        headerView.parent = self
    }
    
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.pinToView(view, topView: headerView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .init(white: 0.95, alpha: 1)
        tableView.rowHeight = 70
        tableView.allowsSelection = false
        
        let cellNib = UINib(nibName: "WeatherCell",bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellId)
    }
    
}
