//
//  SonucData.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation

struct SonucData: Decodable {
    let success: Bool
    let data: Data
}

struct Data: Decodable {
    let hafta: Int
    let cekilisTarihi: String
    let cekilisTuru : String
    let rakamlarNumaraSirasi : String
    let devretti: Bool
    let devirSayisi: Int
    let bilenKisiler: [BilenKisiler]
    let buyukIkrKazananIlIlceler: [BuyukIkrKazananIlIlceler]
}

struct BilenKisiler: Decodable {
    let kisiBasinaDusenIkramiye: Double
    let kisiSayisi: Int32
    let tur: String
}

struct BuyukIkrKazananIlIlceler: Decodable {
    let ilView: String
    let ilceView: String
}
