//
//  LSBodyLabel.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func configure(){
        
        textColor = .secondaryLabel
        textAlignment = .left
        minimumScaleFactor = 0.8
        adjustsFontSizeToFitWidth   = true
        font = UIFont.systemFont(ofSize: 16, weight: .light)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
