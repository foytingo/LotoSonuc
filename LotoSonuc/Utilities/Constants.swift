//
//  Constants.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 5.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

enum NotificationKey {
    static let foregroundKey = "com.foytingo.foreGroundKey"
}

enum UserDefaultsKey {
    static let sayisalLotoAlarmSet = "isAlarmSetSayisal"
    static let onNumaraAlarmSet = "isAlarmSetOnNumara"
    static let superLotoAlarmSet = "isAlarmSetSuperLoto"
    static let sanstopuAlarmSet = "isAlarmSetSansTopu"
}


enum Alert {
    static let titleHata = "Hata"
    static let buttonTamam = "Tamam"
}


enum Identifier {
    static let sayisalLoto0 = "sayisalloto0"
    static let sayisalLoto1 = "sayisalloto1"
    static let sayisalLoto2 = "sayisalloto2"
    static let sayisalLoto3 = "sayisalloto3"
    
    static let superLoto0 = "superloto0"
    static let superLoto1 = "superloto1"
    
    static let sansTopu0 = "sanstopu0"
    static let sansTopu1 = "sanstopu1"
    
    static let onNumara0 = "onnumara0"
    static let onNumara1 = "onnumara1"
}


enum Bildirimler {
    static let kapaliAlertTitle = "Bildirimlere İzin Verilmedi"
    static let kapaliAlertBody = "Ayarlardan uygulamanın bildirim izinlerini açmanız gerekmektedir."

    static let acildiTitle = "Bildirimler Açıldı"
    static let kapandiTitle = "Bildirimler Kapandı"
    static let acildiSayisalLotoBody = "Sayısal Loto için bildirimler açıldı."
    static let kapandiSayisalLotoBody = "Sayısal Loto için bildirimler kapandı."
    static let acildiSuperLotoBody = "Süper Loto için bildirimler açıldı."
    static let kapandiSuperLotoBody = "Süper Loto için bilidirmler kapandı."
    static let acildiSansTopuBody = "Sans Topu için bildirimler açıldı."
    static let kapandiSansTopuBody = "Sans Topu için bildirimler kapandı."
    static let acildiOnNumaraBody = "On Numara için bildirimler açıldı."
    static let kapandiOnNumaraBody = "On Numara için bildirimler kapandı."
    
    static let sayisalLotoBildirimTitle = "Sayısal Loto"
    static let sayisalLotoOyunHatirlatma = "Bugün Sayılsal Loto günü. Saat 20:30'a kadar oynamayı unutmayın.Bol şans."
    static let sayisalLotoSonucHatirlatma = "Sayısal Loto sonuçları belli oldu."
    
    
    static let superLotoBildirimTitle = "Super Loto"
    static let superLotoOyunHatirlatma = "Bugün Süper Loto günü. Saat 20:30'a kadar oynamayı unutmayın.Bol şans."
    static let superLotoSonucHatirlatma = "Super Loto sonuçları belli oldu."
    
    static let sansTopuBildirimTitle = "Şans Topu"
    static let sansTopuOyunHatirlatma = "Bugün Sanş Topu günü. Saat 20:30'a kadar oynamayı unutmayın.Bol şans."
    static let sansTopuSonucHatirlatma = "Sanş Topu sonuçları belli oldu."
    
    
    static let onNumaraBildirimTitle = "On Numara"
    static let onNumaraOyunHatirlatma = "Bugün On Numara günü. Saat 20:30'a kadar oynamayı unutmayın.Bol şans."
    static let onNumaraSonucHatirlatma = "On Numara sonuçları belli oldu."
    
    
    
}
