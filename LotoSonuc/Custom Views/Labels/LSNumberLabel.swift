//
//  LSNumberLabel.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSNumberLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        textColor = .black
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 22, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
