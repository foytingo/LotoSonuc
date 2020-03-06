//
//  LSNumbersTenView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSNumbersTenView: UIView {
    
    
    let stackViewVertical = UIStackView()
    let stackViews = [UIStackView(),UIStackView(),UIStackView(),UIStackView()]
    let balls = [LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView(),LSBallView()]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureStackViews()
        configureStackViewElements()
        configureVerticalStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        layer.cornerRadius = 10
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureStackViews(){
        for stackview in stackViews {
            stackview.axis = .horizontal
            stackview.distribution = .fillProportionally
            stackview.spacing = 5
            stackview.translatesAutoresizingMaskIntoConstraints = false
        }
        stackViews[3].isLayoutMarginsRelativeArrangement = true
        stackViews[3].directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 110, bottom: 0, trailing: 110)
    }
    
    
    private func configureStackViewElements(){
        for index in 0...5 {
            stackViews[0].addArrangedSubview(balls[index])
        }
        for index in 6...11 {
            stackViews[1].addArrangedSubview(balls[index])
        }
        for index in 12...17{
            stackViews[2].addArrangedSubview(balls[index])
        }
        for index in 18...19{
            stackViews[3].addArrangedSubview(balls[index])
        }
    }
    
    
    private func configureVerticalStackView(){
        addSubview(stackViewVertical)
        stackViewVertical.axis = .vertical
        stackViewVertical.distribution = .fillProportionally
        stackViewVertical.spacing = 5
        stackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        
        for stackview in stackViews {
            stackViewVertical.addArrangedSubview(stackview)
        }
        
        NSLayoutConstraint.activate([
            stackViewVertical.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackViewVertical.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackViewVertical.widthAnchor.constraint(equalToConstant: 325),
            stackViewVertical.heightAnchor.constraint(equalToConstant: 215)
        ])
    }
    
    
    func proccess(with sonucData: SonucData){
        let numArray = sonucData.data.rakamlarNumaraSirasi.components(separatedBy: " - ")
        for index in 0...19 {
            balls[index].set(number: numArray[index])
        }
    }
}

