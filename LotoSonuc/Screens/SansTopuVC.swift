//
//  SansTopuVC.swift
//  LotoSonuc
//
//  Created by Murat Baykor on 27.02.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class SansTopuVC: LSDataLoadingVC {
    
    let defaults = UserDefaults.standard
    let notificationManager = NotificationManager()
    let name = Notification.Name(rawValue: NotificationKey.foregroundKey)
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let refreshControl = UIRefreshControl()
    
    let headerView = LSHeaderView()
    let numberView = LSNumbersFivePlusView()
    let detailView = LSDetailsSansTopuView()
    
    var tarihRow: Int = 0
    var isAlarmSet : Bool = false
    var tarihler: [[String : String]]? {
        didSet {
            self.getSonuc(date: self.tarihler![tarihRow]["tarih"]!)
        }
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createObserver()
        configureNavBar()
        configureScrollView()
        configureHeaderView()
        configureNumberView()
        configureDetailView()
        configureRefreshControl()
        getTarihler()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let tarihlerWrapped = tarihler {
            getSonuc(date: tarihlerWrapped[tarihRow]["tarih"]!)
        }
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        tarihRow = 0
    }
    
    
    func createObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(printIfNotification), name: name, object: nil)
    }
    
    
    @objc func printIfNotification(){
        if let tarihlerWrapped = tarihler {
            getSonuc(date: tarihlerWrapped[tarihRow]["tarih"]!)
        }
    }
    
    
    func configureNavBar(){
        let bellFill : UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(bellFillButtonAction))
        let bell : UIBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellButtonAction))
        
        isAlarmSet = defaults.bool(forKey: UserDefaultsKey.sanstopuAlarmSet)
        navigationItem.rightBarButtonItem = isAlarmSet ? bellFill : bell
    }
    
    
    @objc func bellFillButtonAction(){
        isAlarmSet = !isAlarmSet
        defaults.set(isAlarmSet, forKey: UserDefaultsKey.sanstopuAlarmSet)
        cancelNotification()
    }
    
    
    @objc func bellButtonAction() {
        isAlarmSet = !isAlarmSet
        defaults.set(isAlarmSet, forKey: UserDefaultsKey.sanstopuAlarmSet)
        checkNotificationAuthAndSetNotification()
    }
    
    
    private func checkNotificationAuthAndSetNotification(){
        notificationManager.center.getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.notificationManager.askPermission()
            case .denied:
                self.presentLSAlertOnMainThread(title: Bildirimler.kapaliAlertTitle, titleColor: UIColor.systemRed, message: Bildirimler.kapaliAlertBody, buttonTitle: Alert.buttonTamam)
            case .authorized:
                self.setNotification()
            case .provisional:
                self.setNotification()
            @unknown default:
                break
            }
        }
    }
    
    
    private func setNotification(){
        notificationManager.reminderNotifications(identifier: Identifier.sansTopu0, title: Bildirimler.sansTopuBildirimTitle, body: Bildirimler.sansTopuOyunHatirlatma, weekday: 4, hour: 17, minute: 25)
        
        notificationManager.resultNotifications(identifier: Identifier.sansTopu1, title: Bildirimler.sansTopuBildirimTitle, body: Bildirimler.sansTopuSonucHatirlatma , weekday: 4, hour: 21, minute: 45)
        
        self.presentLSAlertOnMainThread(title: Bildirimler.acildiTitle, titleColor: UIColor.label, message: Bildirimler.acildiSansTopuBody, buttonTitle: Alert.buttonTamam)
        
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(self.bellFillButtonAction))
        }
    }
    
    
    private func cancelNotification(){
        notificationManager.center.removePendingNotificationRequests(withIdentifiers: [Identifier.sansTopu0,Identifier.sansTopu1])
        
        self.presentLSAlertOnMainThread(title: Bildirimler.kapandiTitle, titleColor: UIColor.label, message: Bildirimler.kapandiSansTopuBody, buttonTitle: Alert.buttonTamam)
        
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(self.bellButtonAction))
        }
    }
    
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdge(of: view)
        contentView.pinToEdge(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 875)
        ])
    }
    
    
    private func configureRefreshControl(){
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    
    @objc func pullToRefresh(){
        tarihRow = 0
        getTarihler()
    }
    
    
    private func getTarihler(){
        refreshControl.endRefreshing()
        showLoadingView()
        SonucManager.shared.getDates(for: "sanstopu") { [weak self]result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let tarih):
                self.tarihler = tarih
            case .failure(let error):
                self.presentLSAlertOnMainThread(title: Alert.titleHata, titleColor: UIColor.systemRed, message: error.rawValue, buttonTitle: Alert.buttonTamam)
            }
        }
    }
    
    
    private func getSonuc(date: String){
        SonucManager.shared.getSonuc(for: "sanstopu/", date: date) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sonuc):
                self.configureData(with: sonuc)
            case .failure(let error):
                self.presentLSAlertOnMainThread(title: Alert.titleHata, titleColor: UIColor.systemRed, message: error.rawValue, buttonTitle: Alert.buttonTamam)
            }
        }
    }
    
    
    private func configureHeaderView(){
        contentView.addSubview(headerView)
        
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: padding),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            headerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    
    private func configureData(with data: SonucData){
        DispatchQueue.main.async {
            self.numberView.proccess(with: data)
            self.headerView.process(with: data)
            self.headerView.changeButton.addTarget(self, action: #selector(self.changeButtonTapped), for: .touchUpInside)
            self.detailView.process(with: data)
            self.scrollView.refreshControl?.endRefreshing()
        }
        
    }
    
    
    @objc func changeButtonTapped() {
        let tarihList = TarihListVC()
        tarihList.tarihler = tarihler!
        tarihList.selectDateDelegate = self
        navigationController?.pushViewController(tarihList, animated: true)
    }
    
    
    private func configureNumberView(){
        contentView.addSubview(numberView)
        
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            numberView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            numberView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            numberView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            numberView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    
    private func configureDetailView(){
        contentView.addSubview(detailView)
        
        let padding : CGFloat = 20
        
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: numberView.bottomAnchor, constant: padding),
            detailView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            detailView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            detailView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension SansTopuVC: SelectDateDelegate{
    func didSelectDate(dateValue: Int) {
        tarihRow = dateValue
    }
}

