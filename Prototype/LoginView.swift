//
//  LoginView.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    let loginButton = BlackButton(title: "Login")
    let goToLoginButton = UIButton(type: .system)
    let haveAccountLabel = UILabel.create("Don't have an account?", .rgb(112,112,112), .mainFont(.light, 18.scaled))
    
    let loginLabel = UILabel.create("Login", .black, .mainFont(.bold, 24.scaled))
    let emailLoginTextField = LoginTextField(placeholder: "Email")
    let passwordLoginTextField = LoginTextField(placeholder: "Password")
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    init() {
        super.init(frame: .zero)
        
        loginLabel.addToView(self, .top(20.scaled.pad), .left(20.scaled.pad))
        emailLoginTextField.addToView(self, .left(20.scaled.pad), .right(20.scaled.pad), .top(loginLabel.bottom, 10.scaled.pad), .height(38.scaled.constant))
        
        passwordLoginTextField.addToView(self, .left(20.scaled.pad), .right(20.scaled.pad), .top(emailLoginTextField.bottom, 10.scaled.pad), .height(38.scaled.constant))
        
        loginButton.addToView(self, .right(20.scaled.pad), .top(10.scaled.pad, passwordLoginTextField.bottom), .height(38.scaled.constant), .width(80.scaled.constant))
        
        passwordLoginTextField.isSecureTextEntry = true
        
        haveAccountLabel.addToView(self, .left(20.scaled.pad), .top(loginButton.bottom, 20.scaled.pad))
        goToLoginButton.setTitle("Login", for: [])
        goToLoginButton.titleLabel?.font = .mainFont(.light, 18.scaled)
        goToLoginButton.addToView(self, .left(haveAccountLabel.right, 2.scaled.pad), .top(haveAccountLabel.bottom, 20.scaled.pad))
    }
}
