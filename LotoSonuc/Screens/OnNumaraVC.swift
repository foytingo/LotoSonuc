//
//  OnNumaraVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit



class OnNumaraVC: LSDataLoadingVC {
    
    let headerView = UIView()
    let ballView = UIView()

    var sonTarih: String!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureHeaderView()
        configureBallsView()
        getSonTariheGoreSonuc()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func getSonTariheGoreSonuc(){
        showLoadingView()
        SonucManager.shared.getDates(for: "sayisal") { [weak self]result in
            guard let self = self else { return }
            switch result {
            case .success(let tarih):
                self.getSonucSon(date: tarih[0]["tarih"]!)
                self.dismissLoadingView()
            case .failure(_):
                print("error")
            }
        }
    }
 
    
    private func getSonuc(date: String){
        
        SonucManager.shared.getSonuc(for: "sayisal/SAY_", date: date) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let sonuc):
                DispatchQueue.main.async {
                    self.configureUIElement(with: sonuc)
                    
                }
            case .failure(_):
                print(date)
                print("Error")
            }
        }
    }

    private func getSonucSon(date: String){
        SonucManager.shared.getSonuc(for: "sayisal/SAY_", date: date) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let sonuc):
                DispatchQueue.main.async {
                    self.configureUIElement(with: sonuc)
                }
            case .failure(_):
                print(date)
                print("Error")
            }
        }
    }
    
    private func configureUIElement(with sonucData: SonucData){
        self.add(childVC: LSNumbersVC(sonucData: sonucData), to: ballView)
        self.add(childVC: LSHeaderVC(sonucData: sonucData), to: headerView)
        
    }
    
    private func configureHeaderView(){
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    
    private func configureBallsView(){
        view.addSubview(ballView)
        ballView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            ballView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            ballView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            ballView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ballView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
}

extension OnNumaraVC: SelectDateDelegate{
    func didSelectDate(dateValue: String) {
        getSonuc(date: dateValue)
        
    }
}
