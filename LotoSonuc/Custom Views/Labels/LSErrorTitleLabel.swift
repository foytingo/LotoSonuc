//
//  LSErrorTitleLabel.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 3.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSErrorTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        textColor                   = .label
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

