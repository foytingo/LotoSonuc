//
//  LSDetailsView.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 2.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSDetailsView: UIView {
    let ten = LSKnownView(number: "10", isUsedSansTopu: false, fontSize: 60)
    let nine = LSKnownView(number: "9", isUsedSansTopu: false, fontSize: 60)
    let eight = LSKnownView(number: "8", isUsedSansTopu: false, fontSize: 60)
    let seven = LSKnownView(number: "7", isUsedSansTopu: false, fontSize: 60)
    let six = LSKnownView(number: "6", isUsedSansTopu: false, fontSize: 60)
    let five = LSKnownView(number: "5", isUsedSansTopu: false, fontSize: 60)
    let four = LSKnownView(number: "4", isUsedSansTopu: false, fontSize: 60)
    let three = LSKnownView(number: "3", isUsedSansTopu: false, fontSize: 60)
    let zero = LSKnownView(number: "0", isUsedSansTopu: false, fontSize: 60)
    
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
        let padding: CGFloat = 15
        
        if sonucData.data.cekilisTuru == "ON_NUMARA" {
            
            addSubview(ten)
            
            NSLayoutConstraint.activate([
                ten.topAnchor.constraint(equalTo: topAnchor, constant: padding),
                ten.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                ten.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                ten.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(nine)
            
            NSLayoutConstraint.activate([
                nine.topAnchor.constraint(equalTo: ten.bottomAnchor, constant: padding),
                nine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                nine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                nine.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(eight)
            
            NSLayoutConstraint.activate([
                eight.topAnchor.constraint(equalTo: nine.bottomAnchor, constant: padding),
                eight.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                eight.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                eight.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(seven)
            
            NSLayoutConstraint.activate([
                seven.topAnchor.constraint(equalTo: eight.bottomAnchor, constant: padding),
                seven.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                seven.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                seven.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(six)
            
            NSLayoutConstraint.activate([
                six.topAnchor.constraint(equalTo: seven.bottomAnchor, constant: padding),
                six.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                six.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                six.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(zero)
            
            NSLayoutConstraint.activate([
                zero.topAnchor.constraint(equalTo: six.bottomAnchor, constant: padding),
                zero.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                zero.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                zero.heightAnchor.constraint(equalToConstant: 60)
            ])
         
            ten.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[5].kisiSayisi)"
            ten.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[5].kisiBasinaDusenIkramiye.formatNumber()) TL"
            nine.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[4].kisiSayisi)"
            nine.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[4].kisiBasinaDusenIkramiye.formatNumber()) TL"
            eight.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiSayisi)"
            eight.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiBasinaDusenIkramiye.formatNumber()) TL"
            seven.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiSayisi)"
            seven.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiBasinaDusenIkramiye.formatNumber()) TL"
            six.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiSayisi)"
            six.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiBasinaDusenIkramiye.formatNumber()) TL"
            zero.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiSayisi)"
            zero.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiBasinaDusenIkramiye.formatNumber()) TL"
        }
        
        if sonucData.data.cekilisTuru == "SAYISAL_LOTO" || sonucData.data.cekilisTuru == "SUPER_LOTO" {
              
            addSubview(six)
            
            NSLayoutConstraint.activate([
                six.topAnchor.constraint(equalTo: topAnchor, constant: padding),
                six.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                six.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                six.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(five)
            
            NSLayoutConstraint.activate([
                five.topAnchor.constraint(equalTo: six.bottomAnchor, constant: padding),
                five.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                five.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                five.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(four)
            
            NSLayoutConstraint.activate([
                four.topAnchor.constraint(equalTo: five.bottomAnchor, constant: padding),
                four.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                four.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                four.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            addSubview(three)
            
            NSLayoutConstraint.activate([
                three.topAnchor.constraint(equalTo: four.bottomAnchor, constant: padding),
                three.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                three.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                three.heightAnchor.constraint(equalToConstant: 60)
            ])
           
       
            six.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiSayisi)"
            six.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[3].kisiBasinaDusenIkramiye.formatNumber()) TL"
            five.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiSayisi)"
            five.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[2].kisiBasinaDusenIkramiye.formatNumber()) TL"
            four.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiSayisi)"
            four.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[1].kisiBasinaDusenIkramiye.formatNumber()) TL"
            three.numberKnownLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiSayisi)"
            three.numberAmountLabel.text = ": \(sonucData.data.bilenKisiler[0].kisiBasinaDusenIkramiye.formatNumber()) TL"
            
           
        }
        
        
        
    }
}
