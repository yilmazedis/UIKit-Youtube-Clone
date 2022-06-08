//
//  HomeViewController.swift
//  UIKit-Youtube-Clone
//
//  Created by yilmaz on 2.06.2022.
//

import UIKit
import TinyConstraints

final class HomeViewController: UIViewController {
    
    let profileImageViewHeight: CGFloat = 30
    
    lazy var profileImageView: UIButton = {
        let btn = UIButton(type: .custom)
        btn.contentMode = .scaleAspectFill
        btn.setImage(UIImage(named: "Me"), for: .normal)
        btn.layer.cornerRadius = profileImageViewHeight / 2
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(profileImageTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var searchImageView: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        btn.addTarget(self, action: #selector(profileImageTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var notificationImageView: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "Notification"), for: .normal)
        btn.addTarget(self, action: #selector(profileImageTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    lazy var castImageView: UIButton = {
        let btn = UIButton(type: .custom)
        
        btn.setImage(UIImage(named: "Cast"), for: .normal)
        btn.addTarget(self, action: #selector(profileImageTouchUpInside), for: .touchUpInside)
        return btn
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(HomeTableViewCell.self, forCellReuseIdentifier: K.cell)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableHeaderView = HomeHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        var logo = UIImage(named: "LogoPremium")
        logo = logo?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logo,
                                                           style: .done,
                                                           target: self,
                                                           action: nil)
        profileImageView.width(profileImageViewHeight)
        profileImageView.height(profileImageViewHeight)
        castImageView.width(profileImageViewHeight)
        castImageView.height(profileImageViewHeight)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: profileImageView),
            UIBarButtonItem(customView: searchImageView),
            UIBarButtonItem(customView: notificationImageView),
            UIBarButtonItem(customView: castImageView)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc private func profileImageTouchUpInside() {
        print("Profile")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cell, for: indexPath) as? HomeTableViewCell else {
            print("yilmaz")
            return UITableViewCell()
        }
        
        cell.configure()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(K.cellHight)
    }
}
