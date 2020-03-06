//
//  LSKnownView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSKnownView: UIView {
    
    let knownNumber = LSKnownNumberLabel()
    let titleKnownLabel = LSBodyLabel()
    let numberKnownLabel = LSBodyLabel()
    let titleAmountLabel = LSBodyLabel()
    let numberAmountLabel = LSBodyLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    init(number: String , isUsedSansTopu: Bool, fontSize: CGFloat){
        super.init(frame: .zero)
        knownNumber.text = number
        knownNumber.font = UIFont.systemFont(ofSize: fontSize, weight: .thin)
        configureView()
        configureNumber(isUsedSansTopu)
        configure()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureView(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureNumber(_ isUsedSansTopu: Bool){
        
        let width : CGFloat = isUsedSansTopu ? 75 : 60
    
        addSubview(knownNumber)
        
        NSLayoutConstraint.activate([
            knownNumber.topAnchor.constraint(equalTo: topAnchor),
            knownNumber.leadingAnchor.constraint(equalTo: leadingAnchor),
            knownNumber.widthAnchor.constraint(equalToConstant: width),
            knownNumber.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func configure(){
        addSubview(titleKnownLabel)
        
        titleKnownLabel.text = "Bilen kisi sayisi"
        NSLayoutConstraint.activate([
            titleKnownLabel.topAnchor.constraint(equalTo: topAnchor),
            titleKnownLabel.leadingAnchor.constraint(equalTo: knownNumber.trailingAnchor, constant: 10),
            titleKnownLabel.widthAnchor.constraint(equalToConstant: 136),
            titleKnownLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(numberKnownLabel)
        
        NSLayoutConstraint.activate([
            numberKnownLabel.topAnchor.constraint(equalTo: topAnchor),
            numberKnownLabel.leadingAnchor.constraint(equalTo: titleKnownLabel.trailingAnchor),
            numberKnownLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numberKnownLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(titleAmountLabel)
        
        titleAmountLabel.text = "Kisi basi ikramiye"
        NSLayoutConstraint.activate([
            titleAmountLabel.topAnchor.constraint(equalTo: titleKnownLabel.bottomAnchor),
            titleAmountLabel.leadingAnchor.constraint(equalTo: knownNumber.trailingAnchor, constant: 10),
            titleAmountLabel.widthAnchor.constraint(equalToConstant: 136),
            titleAmountLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addSubview(numberAmountLabel)
        
        NSLayoutConstraint.activate([
            numberAmountLabel.topAnchor.constraint(equalTo: titleKnownLabel.bottomAnchor),
            numberAmountLabel.leadingAnchor.constraint(equalTo: titleAmountLabel.trailingAnchor),
            numberAmountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            numberAmountLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
}
