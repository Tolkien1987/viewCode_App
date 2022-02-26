//
//  ViewController.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 24/02/22.
//

import UIKit

class ViewController: UIViewController {

    var loginScreen: LoginScreen?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }

}

