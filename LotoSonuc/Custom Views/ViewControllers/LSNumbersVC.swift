//
//  LSNumbersVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 28.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSNumbersVC: UIViewController {
    
    let stackView = UIStackView()
    let ball1 = LSBallView()
    let ball2 = LSBallView()
    let ball3 = LSBallView()
    let ball4 = LSBallView()
    let ball5 = LSBallView()
    let ball6 = LSBallView()
    
    var sonucData: SonucData!
    
    init(sonucData: SonucData){
        super.init(nibName: nil, bundle: nil)
        self.sonucData = sonucData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundview()
        layoutUI()
        configureStackView()
        proccess(with: sonucData)
    }
    
    
    private func configureBackgroundview(){
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
    }
    
    
    private func configureStackView(){
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.addArrangedSubview(ball1)
        stackView.addArrangedSubview(ball2)
        stackView.addArrangedSubview(ball3)
        stackView.addArrangedSubview(ball4)
        stackView.addArrangedSubview(ball5)
        stackView.addArrangedSubview(ball6)
        
    }
    
    private func layoutUI(){
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 325),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    private func proccess(with sonucData: SonucData){
        let numArray = sonucData.data.rakamlarNumaraSirasi.components(separatedBy: " - ")
        ball1.set(number: numArray[0])
        ball2.set(number: numArray[1])
        ball3.set(number: numArray[2])
        ball4.set(number: numArray[3])
        ball5.set(number: numArray[4])
        ball6.set(number: numArray[5])
        
    }
    

    
}
