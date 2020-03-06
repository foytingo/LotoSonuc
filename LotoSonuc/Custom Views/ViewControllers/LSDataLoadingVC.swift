//
//  LSDataLoadingVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 28.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSDataLoadingVC: UIViewController {
    
    var containerView: UIView!
    
    func showLoadingView() {
        DispatchQueue.main.async {
            
            self.containerView = UIView(frame: self.view.bounds)
            self.view.addSubview(self.containerView)
            
            self.containerView.backgroundColor   = .systemBackground
            self.containerView.alpha             = 0
            
            UIView.animate(withDuration: 0.5) { self.containerView.alpha = 0.8 }
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            self.containerView.addSubview(activityIndicator)
            
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                activityIndicator.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),
                activityIndicator.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor)
            ])
            
            activityIndicator.startAnimating()
        }
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
        }
    }
    
}
