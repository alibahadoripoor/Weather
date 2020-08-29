//
//  SearchView.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

final class SearchView: UIView {
    
    weak var parent: WeatherViewController!
    
    private let locationButton = UIButton()
    private let searchTextField = UITextField()
    private let goButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI(){
        backgroundColor = .myBlue
        setupLocationButton()
        setupSearchTextField()
        setupGoButton()
    }
    
    private func setupLocationButton(){
        addSubview(locationButton)
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setImage(UIImage(named: "gps"), for: .normal)
        locationButton.imageView?.contentMode = .scaleAspectFit
        locationButton.addTarget(
            self,
            action: #selector(locationButtonDidSelect),
            for: .touchUpInside
        )
        
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            locationButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            locationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            locationButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSearchTextField(){
        addSubview(searchTextField)
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Enter City Name Here"
        searchTextField.font = .systemFont(ofSize: 20)
        searchTextField.layer.cornerRadius = 19
        searchTextField.layer.borderColor = UIColor.lightGray.cgColor
        searchTextField.layer.borderWidth = 0.7
        searchTextField.textColor = .black
        searchTextField.backgroundColor = .white
        searchTextField.addPadding(10)
        searchTextField.delegate = self
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            searchTextField.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 10),
            searchTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    private func setupGoButton(){
        addSubview(goButton)
        
        goButton.translatesAutoresizingMaskIntoConstraints = false
        goButton.setTitle("GO!", for: .normal)
        goButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
        goButton.setTitleColor(.black, for: .normal)
        goButton.addTarget(
            self,
            action: #selector(goButtonDidSelect),
            for: .touchUpInside
        )
        
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            goButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 10),
            goButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            goButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func locationButtonDidSelect(){
        parent.viewModel.locationButtonDidSelect()
    }
    
    @objc private func goButtonDidSelect(){
        parent.viewModel.goButtonDidSelect()
        searchTextField.resignFirstResponder()
        searchTextField.text = ""
    }
}

extension SearchView: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        parent.viewModel.cityName = textField.text!
    }
}
