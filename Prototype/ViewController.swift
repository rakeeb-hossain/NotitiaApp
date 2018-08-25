//
//  ViewController.swift
//  Prototype
//
//  Created by Rakeeb on 2018-07-30.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    let backgroundView = UIView()
    let notitiaLogo = UIImageView(image: UIImage(named: "NotitiaTransparent"))
    let registerView = RegisterView()
    let loginView = LoginView()
    
    var textFieldEditing = false
    
    var isRegistration = true {
        didSet {
            if !oldValue && isRegistration {
                registerView.x1Anchor = .left
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
            else if oldValue && !isRegistration {
                registerView.x1Anchor = .left((-self.view.frame.width).pad)
                UIView.animate(withDuration: 0.2) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.view.backgroundColor = .white
        
        backgroundView.addToView(self.view, .left, .right, .top, .height(0.55.ratio))
        backgroundView.backgroundColor = .black
        self.notitiaLogo.addToView(self.backgroundView, .centerX, .centerY, .height(0.7.ratio))
        self.notitiaLogo.contentMode = .scaleAspectFit
        
        registerView.addToView(self.view, .left, .width, .top(backgroundView.bottom), .bottom)
        loginView.addToView(self.view, .left(registerView.right), .width, .top(backgroundView.bottom), .bottom)
        
        
        notitiaLogo.alpha = 0.8
        notitiaLogo.clipsToBounds = true
        
        registerView.emailRegisterTextField.delegate = self
        registerView.passwordRegisterTextField.delegate = self
        registerView.passwordConfirmationTextField.delegate = self
        
        loginView.emailLoginTextField.delegate = self
        loginView.passwordLoginTextField.delegate = self
        
        // add targets
        registerView.registrationButton.addTarget(self, action: #selector(registerNewAccountPressed(sender:)), for: .touchUpInside)
        registerView.goToLoginButton.addTarget(self, action: #selector(switchToLogin(sender:)), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(registerNewAccountPressed(sender:)), for: .touchUpInside)
        loginView.goToLoginButton.addTarget(self, action: #selector(switchToLogin(sender:)), for: .touchUpInside)
    }
    
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        if textFieldEditing {
            textFieldEditing = false
            self.registerView.emailRegisterTextField.resignFirstResponder()
            self.registerView.passwordRegisterTextField.resignFirstResponder()
            self.registerView.passwordConfirmationTextField.resignFirstResponder()
            self.loginView.emailLoginTextField.resignFirstResponder()
            self.loginView.passwordLoginTextField.resignFirstResponder()
            self.backgroundView.heightALAnchor = .height(0.55.ratio)
            self.registerView.registerLabel.y1Anchor = .top(10.scaled.pad, self.backgroundView.bottom)
            UIView.animate(withDuration: 0.25) {
                self.view.layoutRootView()
            }
        }
    }
    
    @objc func switchToLogin(sender: UIButton) {
        self.isRegistration = !isRegistration
    }
    
    @objc func registerNewAccountPressed(sender: UIButton) {
        if !self.isRegistration {
            // login
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "home")
            
            self.present(vc!, animated: true, completion: nil)
        }
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldEditing = true
        // update layout and constraints
        self.backgroundView.heightALAnchor = .height(0.15.ratio)
        self.registerView.registerLabel.y1Anchor = .top(5.scaled.pad, self.backgroundView.bottom)
        UIView.animate(withDuration: 0.25) {
            self.view.layoutRootView()
        }
    }


}

