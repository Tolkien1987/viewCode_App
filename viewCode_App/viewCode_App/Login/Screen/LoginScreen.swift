//
//  LoginScreen.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 26/02/22.
//

import UIKit

class LoginScreen: UIView {

    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Login"
        return label
    }()
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoImageView)
        
        
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -150),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 80)
           

        ])
    }
}
