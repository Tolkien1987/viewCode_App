//
//  RegisterVC.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 02/03/22.
//

import UIKit

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
