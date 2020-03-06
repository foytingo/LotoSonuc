//
//  LSDetailsSansTopuView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSDetailsSansTopuView: UIView {
    
    let fivePlusOne = LSKnownView(number: "5+1", isUsedSansTopu: true, fontSize: 40)
    let five = LSKnownView(number: "5", isUsedSansTopu: true,fontSize: 40)
    let fourPlusOne = LSKnownView(number: "4+1", isUsedSansTopu: true, fontSize: 40)
    let four = LSKnownView(number: "4", isUsedSansTopu: true, fontSize: 40)
    let threePlusOne = LSKnownView(number: "3+1", isUsedSansTopu: true, fontSize: 40)
    let three = LSKnownView(number: "3", isUsedSansTopu: true, fontSize: 40)
    let twoPlusOne = LSKnownView(number: "2+1", isUsedSansTopu: true, fontSize: 40)
    let onePlusOne = LSKnownView(number: "1+1", isUsedSansTopu: true, fontSize: 40)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(){
        layer.cornerRadius = 10
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func process(with sonucData: SonucData){
        
        if sonucData.data.cekilisTuru == "SANS_TOPU" {
            let padding: CGFloat = 15
            let knownTypes = [fivePlusOne,five,fourPlusOne,four,threePlusOne,three,twoPlusOne,onePlusOne]
            
            for knownType in knownTypes {
                self.addSubview(knownType)
                NSLayoutConstraint.activate([
                    knownType.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                    knownType.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                    knownType.heightAnchor.constraint(equalToConstant: 60)
                ])
            }
            
            NSLayoutConstraint.activate([
                fivePlusOne.topAnchor.constraint(equalTo: topAnchor, constant: padding),
                five.topAnchor.constraint(equalTo: fivePlusOne.bottomAnchor, constant: padding),
                fourPlusOne.topAnchor.constraint(equalTo: five.bottomAnchor, constant: padding),
                four.topAnchor.constraint(equalTo: fourPlusOne.bottomAnchor, constant: padding),
                threePlusOne.topAnchor.constraint(equalTo: four.bottomAnchor, constant: padding),
                three.topAnchor.constraint(equalTo: threePlusOne.bottomAnchor, constant: padding),
                twoPlusOne.topAnchor.constraint(equalTo: three.bottomAnchor, constant: padding),
                onePlusOne.topAnchor.constraint(equalTo: twoPlusOne.bottomAnchor, constant: padding),
            ])
            
            fivePlusOne.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[7].kisiSayisi)"
            fivePlusOne.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[7].kisiBasinaDusenIkramiye.formatNumber()) TL"
            five.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[6].kisiSayisi)"
            five.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[6].kisiBasinaDusenIkramiye.formatNumber()) TL"
            fourPlusOne.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[5].kisiSayisi)"
            fourPlusOne.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[5].kisiBasinaDusenIkramiye.formatNumber()) TL"
            four.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[4].kisiSayisi)"
            four.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[4].kisiBasinaDusenIkramiye.formatNumber()) TL"
            threePlusOne.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiSayisi)"
            threePlusOne.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiBasinaDusenIkramiye.formatNumber()) TL"
            three.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiSayisi)"
            three.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiBasinaDusenIkramiye.formatNumber()) TL"
            twoPlusOne.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiSayisi)"
            twoPlusOne.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiBasinaDusenIkramiye.formatNumber()) TL"
            onePlusOne.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiSayisi)"
            onePlusOne.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiBasinaDusenIkramiye.formatNumber()) TL"
        }
        
        
        
    }
    
}
