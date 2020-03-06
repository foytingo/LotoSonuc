//
//  UIViewController+Ext.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 3.03.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentLSAlertOnMainThread(title: String, titleColor: UIColor, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = LSAlertVC(title: title, titleColor: titleColor, message: message, buttonTitle: buttonTitle)
            
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
