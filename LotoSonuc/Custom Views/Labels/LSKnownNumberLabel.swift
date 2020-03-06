//
//  LSKnownNumberLabel.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSKnownNumberLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        
        textColor = .secondaryLabel
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 60, weight: .thin)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
