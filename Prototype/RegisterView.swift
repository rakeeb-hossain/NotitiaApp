//
//  RegisterView.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    
    let registrationButton = BlackButton(title: "Register")
    let goToLoginButton = UIButton(type: .system)
    let haveAccountLabel = UILabel.create("Have an account?", .rgb(112,112,112), .mainFont(.light, 18.scaled))

    let registerLabel = UILabel.create("Register", .black, .mainFont(.bold, 24.scaled))
    let emailRegisterTextField = LoginTextField(placeholder: "Email")
    let passwordRegisterTextField = LoginTextField(placeholder: "Password")
    let passwordConfirmationTextField = LoginTextField(placeholder: "Repeat Password")
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    init() {
        super.init(frame: .zero)
        
        registerLabel.addToView(self, .top(20.scaled.pad), .left(20.scaled.pad))
        emailRegisterTextField.addToView(self, .left(20.scaled.pad), .right(20.scaled.pad), .top(registerLabel.bottom, 10.scaled.pad), .height(38.scaled.constant))
        
        passwordRegisterTextField.addToView(self, .left(20.scaled.pad), .right(20.scaled.pad), .top(emailRegisterTextField.bottom, 10.scaled.pad), .height(38.scaled.constant))
        passwordConfirmationTextField.addToView(self, .left(20.scaled.pad), .right(20.scaled.pad), .top(passwordRegisterTextField.bottom, 10.scaled.pad), .height(38.scaled.constant))
        
        registrationButton.addToView(self, .right(20.scaled.pad), .top(10.scaled.pad, passwordConfirmationTextField.bottom), .height(38.scaled.constant), .width(80.scaled.constant))
        
        passwordRegisterTextField.isSecureTextEntry = true
        passwordConfirmationTextField.isSecureTextEntry = true
        
        haveAccountLabel.addToView(self, .left(20.scaled.pad), .centerY(registrationButton.centerY))
        goToLoginButton.setTitle("Login", for: [])
        goToLoginButton.titleLabel?.font = .mainFont(.light, 18.scaled)
        goToLoginButton.addToView(self, .left(haveAccountLabel.right, 2.scaled.pad), .centerY(haveAccountLabel.centerY))
    }
}
