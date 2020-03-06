//
//  TarihListVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 28.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

protocol SelectDateDelegate{
    func didSelectDate(dateValue: Int)
}


class TarihListVC: LSDataLoadingVC {
    
    let tableView = UITableView()
    var tarihler : [[String : String]] = [[:]]
    var tarihArray : [String] = []
    var tarihArrayValue : [String] = []
    
    var selectDateDelegate: SelectDateDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        updateUI(with: tarihler)
    }
    
    
    func configureViewController() {
        view.backgroundColor    = .systemBackground
        title                   = "Çekiliş Tarihleri"
    }
    
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func updateUI(with tarihler: [[String : String]]){
        for tarih in tarihler {
            tarihArray.append(tarih["tarihView"]!)
            tarihArrayValue.append(tarih["tarih"]!)
        }
    }
    
    
}


extension TarihListVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarihArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = tarihArray[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectDateDelegate.didSelectDate(dateValue: indexPath.row)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
