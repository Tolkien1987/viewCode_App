//
//  HomeScreen.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 03/03/22.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configbackground()
        self.addSubView()
        self.setUpConstraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func configbackground() {
        self.backgroundColor = .white
    }
    
    func addSubView() {
        self.addSubview(self.tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        
        
        ])
    }
    
}
