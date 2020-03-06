//
//  LSBallView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 28.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSBallView: UIView {

    let numberLabel = LSNumberLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        backgroundColor = .systemYellow
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureLabel(){
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            numberLabel.widthAnchor.constraint(equalToConstant: 30),
            numberLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func set(number : String){
        numberLabel.text = number
    }
   
}
