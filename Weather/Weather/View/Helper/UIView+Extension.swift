//
//  UIView+Extension.swift
//  Weather
//
//  Created by Ali Bahadori on 27.08.20.
//  Copyright © 2020 Ali Bahadori. All rights reserved.
//

import UIKit

extension UIView {
    func pinToTop(_ view: UIView, height: CGFloat){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func pinToView(_ view: UIView, topView: UIView, height: CGFloat? = nil){
        self.translatesAutoresizingMaskIntoConstraints = false
        if height == nil{
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.bottomAnchor),
                self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                self.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }else{
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: topView.safeAreaLayoutGuide.bottomAnchor),
                self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                self.heightAnchor.constraint(equalToConstant: height!)
            ])
        }
    }
}


