//
//  RegisterVC.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 02/03/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    var registerScreen: RegisterScreen?
    
    var auth:Auth?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelagate(delagate: self)
        self.registerScreen?.delagete(delegate: self)
        self.auth = Auth.auth()
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Firebase Auth

extension RegisterVC: RegisterScreenProtocol {
    func actionRegisterButton() {
        
        let email:String = self.registerScreen?.emailTextField.text ?? ""
        let password:String = self.registerScreen?.passwordTextField.text ?? ""
        self.auth?.createUser(withEmail: email, password: password, completion: { (result, error) in
            
            if error != nil {
                print("Authentication Error :( ")
            } else {
                print("Success :) !")
            }
        })
    }
}
