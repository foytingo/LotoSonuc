//
//  LSHeaderVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 28.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSHeaderVC: UIViewController {
    
    let dateLabel = LSTitleLabel()
    let weekLabel = LSTitleLabel()
    let changeButton = LSButton(backgroundColor: .systemBlue, title: "Degistir")
    
    var cekilisTarihi = ""
    var hafta = 0
    
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
        proccess(with: sonucData)
        configureElements()
    }
    
    private func configureBackgroundview(){
        view.layer.cornerRadius = 10
        view.backgroundColor = .secondarySystemBackground
    }
    
    
    private func configureElements() {
        dateLabel.text = "Çekiliş Tarihi: \(cekilisTarihi)"
        weekLabel.text = "Çekiliş: \(hafta)"
    }
    
    private func layoutUI() {
        
        let padding: CGFloat = 20
        view.addSubview(dateLabel)
        view.addSubview(weekLabel)
        view.addSubview(changeButton)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weekLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            weekLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            weekLabel.heightAnchor.constraint(equalToConstant: 30),
            
            changeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            changeButton.widthAnchor.constraint(equalToConstant: 75),
            changeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            changeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
        
        changeButton.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
    }
    
    @objc func changeButtonTapped() {
        let tarihList = TarihListVC()
        tarihList.selectDateDelegate = OnNumaraVC()
        self.navigationController?.pushViewController(tarihList, animated: true)
    }
    
    private func proccess(with sonucData: SonucData){
        cekilisTarihi = sonucData.data.cekilisTarihi
        hafta = sonucData.data.hafta
   
    }
    
}
