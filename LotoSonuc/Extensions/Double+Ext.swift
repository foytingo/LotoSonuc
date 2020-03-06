//
//  Double+Ext.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 3.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

extension Double {
    
    func formatNumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
  
}
