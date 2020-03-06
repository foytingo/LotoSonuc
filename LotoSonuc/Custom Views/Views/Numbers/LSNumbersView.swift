//
//  LSNumbersView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 29.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSNumbersView: UIView {
    
    let stackView = UIStackView()
    let balls = [LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView()]

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func proccess(with sonucData: SonucData){
        let numArray = sonucData.data.rakamlarNumaraSirasi.components(separatedBy: " - ")
        for index in 0...5 {
            balls[index].set(number: numArray[index])
        }
    }
    
    
    private func configureStackView(){
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        
        for ball in balls{
            stackView.addArrangedSubview(ball)
        }
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 325),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
