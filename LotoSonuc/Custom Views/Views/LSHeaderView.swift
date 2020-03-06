//
//  LSHeaderView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 29.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSHeaderView: UIView {
    
    let dateLabel = LSTitleLabel()
    let weekLabel = LSTitleLabel()
    let changeButton = LSButton(backgroundColor: .systemBlue, title: "Degistir")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        layer.cornerRadius = 10
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureElements(){
        let padding: CGFloat = 20
        addSubview(dateLabel)
        addSubview(weekLabel)
        addSubview(changeButton)
        
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weekLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            weekLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            weekLabel.heightAnchor.constraint(equalToConstant: 30),
            
            changeButton.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            changeButton.widthAnchor.constraint(equalToConstant: 75),
            changeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            changeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
 
    }
    
 
    
    func process(with sonucData: SonucData){
        dateLabel.text = "Çekiliş Tarihi: \(sonucData.data.cekilisTarihi)"
        weekLabel.text = "Çekiliş: \(sonucData.data.hafta)"
    }
    
}
