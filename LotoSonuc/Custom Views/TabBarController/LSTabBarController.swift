//
//  LSTabBarController.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class LSTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBlue
        viewControllers = [createSayisalLotoVC(), createSansTopuVC(), createSuperLotoVC(), createOnNumaraVC() ]
    }
    
    
    func createOnNumaraVC() -> UINavigationController{
        let onNumaraVC = OnNumaraVC()
        onNumaraVC.title = "On Numara"
        onNumaraVC.tabBarItem = UITabBarItem(title: "On Numara", image: UIImage(systemName: "stop"), tag: 0)
        return UINavigationController(rootViewController: onNumaraVC)
    }
    
    func createSansTopuVC() -> UINavigationController{
        let sansTopu =  SansTopuVC()
        sansTopu.title = "Şans Topu"
        sansTopu.tabBarItem = UITabBarItem(title: "Sans Topu", image: UIImage(systemName: "stop"), tag: 1)
        return UINavigationController(rootViewController: sansTopu)
    }
    
    func createSayisalLotoVC() -> UINavigationController{
        let sayisalLoto = SayisalLotoVC()
        sayisalLoto.title = "Sayısal Loto"
        sayisalLoto.tabBarItem = UITabBarItem(title: "Sayısal Loto", image: UIImage(systemName: "stop"), tag: 2)
        return UINavigationController(rootViewController: sayisalLoto)
    }
    
    func createSuperLotoVC() -> UINavigationController{
        let superLotoVC = SuperLotoVC()
        superLotoVC.title = "Süper Loto"
        superLotoVC.tabBarItem = UITabBarItem(title: "Süper Loto", image: UIImage(systemName: "stop"), tag: 3)
        return UINavigationController(rootViewController: superLotoVC)
    }
    
}
