//
//  LoginTextFields.swift
//  Prototype
//
//  Created by Kevin Bai on 2018-08-09.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder

        self.layer.borderColor = UIColor.rgb(112,112,112).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.scaled
        self.font = .mainFont(.light, 18.scaled)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 10.scaled, left: 10.scaled, bottom: 10.scaled, right: 10.scaled))
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 10.scaled, left: 10.scaled, bottom: 10.scaled, right: 10.scaled))
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsets(top: 10.scaled, left: 10.scaled, bottom: 10.scaled, right: 10.scaled))
    }
}
