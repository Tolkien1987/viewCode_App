//
//  HomeVCViewController.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 03/03/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var dataUser: [DataUser] = [DataUser(name: "Ozzy", nameImage: "user1"),
                            DataUser(name: "Lita Ford", nameImage: "user2"),
                            DataUser(name: "Eddie Van Halen", nameImage: "user3")
                            ]
    var dataSport : [Sport] = [Sport(name: "Male Guitar", nameImage: "guitarMale"),
                               Sport(name: "Female Guitar", nameImage: "guitarFemale"),
                               Sport(name: "Singer", nameImage: "singer"),
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCellScreen.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell:UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
