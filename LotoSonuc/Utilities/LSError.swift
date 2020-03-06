//
//  LSError.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import Foundation

enum LSError: String,Error {
    case invalidGameNameOrDate = "Oyun türü ya da tarih bilgisi hatalı."
    case unableToComplete = "İstek gerçekleştirilemedi. İnternet bağlantınızı kontrol edin."
    case invalidResponse = "Sunucudan geçerli cevab alınamadı. Tekrar deneyin."
    case invalidData = "Sunucudan alından veri hatalı. Lütfen tekrar deneyin."
}
