//
//  LoginScreen.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 26/02/22.
//

import UIKit

class LoginScreen: UIView {

    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Login"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.loginLabel)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),

        ])
    }
}
