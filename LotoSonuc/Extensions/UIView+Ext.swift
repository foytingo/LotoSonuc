//
//  UIView+Ext.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdge(of superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
}
