//
//  WeatherCell.swift
//  Weather
//
//  Created by Ali Bahadori on 28.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class WeatherCell: UITableViewCell {

    weak var parent: WeatherViewController!
    var index: Int!
    
    //MARK: Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
    }
    
    //MARK: Actions

    @IBAction func chartButton(_ sender: UIButton) {
        parent.viewModel.chartButtonDidSelect(at: index)
    }
    
    func updateCell(with weather: WeatherCellViewModel){
        cityNameLabel.text = weather.title
        dateLabel.text = weather.date
    }
    
}
