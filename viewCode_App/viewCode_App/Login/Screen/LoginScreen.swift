//
//  LoginScreen.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 26/02/22.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
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
        image.alpha = 1.0
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "Type your e-mail"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Type your password"
        textField.isSecureTextEntry = true
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemMint
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("No account? Register!", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperView()
        self.configBackground()
        self.configLoginLabelConstraints()
        self.configLogoImageViewConstraints()
        self.configEmailTextFieldConstraints()
        self.configPasswordTextFieldConstraints()
        self.configLoginButtonConstraints()
        self.configRegisterButtonConstraints()
//      self.setUpConstraints()
        self.configButtonEnable(false)
    }
    
    //MARK: Methods
    
    private func configBackground() {
        self.backgroundColor = .white
    }
    
    private func configSuperView() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoImageView)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
        self.addSubview(self.loginButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    @objc private func tappedRegisterButton() {
        self.delegate?.actionRegisterButton()
    }
    
    public func validateTextFields() {
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.setTitleColor(.black, for: .normal)
            self.loginButton.isEnabled = false
        }
    }
    
    public func getEmail() -> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return self.passwordTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func setUpConstraints() {
//        NSLayoutConstraint.activate([
//
//            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            self.logoImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 50),
//            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
//            self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -150),
//            self.logoImageView.heightAnchor.constraint(equalToConstant: 80),
//            self.emailTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 50),
//            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
//            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
//            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
//            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
//            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 150),
//            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor)
//
//        ])
//    }
    
    //MARK: SnapKit
    
    func configLoginLabelConstraints() {
        self.loginLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    func configLogoImageViewConstraints() {
        self.logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().inset(150)
            make.height.equalTo(80)
        }
    }
    
    func configEmailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImageView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configLoginButtonConstraints() {
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstraints() {
        self.registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.emailTextField.snp.leading)
            make.trailing.equalTo(self.emailTextField.snp.trailing)
            make.height.equalTo(self.emailTextField.snp.height)
        }
    }
}
