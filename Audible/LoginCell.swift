//
//  LoginCell.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 10/2/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLoginCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let emailTextField = TextFieldPadding()
        emailTextField.placeholder = "Enter Email"
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.keyboardType = .emailAddress
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = TextFieldPadding()
        passwordTextField.placeholder = "Enter Password"
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .orange
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        return button
    }()
    
    func setupLoginCell(){
    
        addSubview(imageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        imageView.topAnchor.constraint(equalTo: centerYAnchor, constant: -220).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    
    }
    
    weak var loginControllerDelegate: LoginControllerDelegate?
    
    func loginButtonClicked(){
        loginControllerDelegate?.finishLoggingIn()
    }
    
}
