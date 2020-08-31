//
//  WeatherHeader.swift
//  Weather
//
//  Created by Ali Bahadori on 28.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class WeatherHeader: UIView {
    
    weak var parent: WeatherViewController!

    //MARK: Outlets
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempTypeSwitch: UISwitch!{
        didSet{
            tempTypeSwitch.thumbTintColor = .black
            tempTypeSwitch.layer.borderWidth = 1.5
            tempTypeSwitch.layer.borderColor = UIColor.black.cgColor
            tempTypeSwitch.layer.cornerRadius = 31.0/2.0
        }
    }
    
    //MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .myLightBlue
        setupNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup Nib File
    
    private func setupNib() {
        let bundle = Bundle.init(for: WeatherHeader.self)
        if let viewsToAdd = bundle.loadNibNamed("WeatherHeader", owner: self, options: nil),
            let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        }
    }
    
    //MARK: Actions
    
    @IBAction func tempTypeValueChanged(_ sender: UISwitch) {
        if sender.isOn{
            //is °F
            parent.viewModel.tempTypeSwitchValueChanged(with: .fahrenheit)
        }else{
            //is °C
            parent.viewModel.tempTypeSwitchValueChanged(with: .celsius)
        }
    }
    
    func updateHeader(with weather: WeatherHeaderViewModel){
        cityNameLabel.text = weather.name
        tempLabel.text = weather.temp
        backgroundColor = weather.backgroundColor
    }
}
